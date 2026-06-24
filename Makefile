# ============================================================
# VeriGuard AI — Developer CLI (GNU Make)
# ============================================================
.PHONY: help install dev test lint format typecheck build push deploy clean

PYTHON   := python3
PIP      := $(PYTHON) -m pip
BACKEND  := backend
FRONTEND := frontend

help:  ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	    awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

# ---------- Setup ----------
install: install-backend install-frontend  ## Install all dependencies

install-backend:  ## Install Python dependencies
	cd $(BACKEND) && $(PIP) install -r requirements.txt -r requirements-dev.txt

install-frontend:  ## Install Node dependencies
	cd $(FRONTEND) && npm ci

# ---------- Development ----------
dev:  ## Start full stack in Docker (with hot-reload)
	docker compose up -d --build

dev-backend:  ## Run backend with hot-reload (requires local venv)
	cd $(BACKEND) && uvicorn app.main:app --reload --port 8000

dev-frontend:  ## Run Next.js dev server
	cd $(FRONTEND) && npm run dev

# ---------- Quality ----------
test:  ## Run all tests
	cd $(BACKEND) && pytest -v --cov=app --cov-report=term-missing
	cd $(FRONTEND) && npm run test -- --passWithNoTests

lint:  ## Run all linters
	cd $(BACKEND) && ruff check app tests
	cd $(FRONTEND) && npm run lint

format:  ## Auto-format all code
	cd $(BACKEND) && black app tests && isort app tests
	cd $(FRONTEND) && npm run format

typecheck:  ## Run type checkers
	cd $(BACKEND) && mypy app
	cd $(FRONTEND) && npm run type-check

# ---------- ML Training ----------
train-text:  ## Train the DeBERTa fake-news classifier
	$(PYTHON) ml/training/train_text_classifier.py --config ml/configs/text_classifier.yaml

train-gnn:  ## Train the GraphSAGE bot detector
	$(PYTHON) ml/training/train_gnn.py --config ml/configs/gnn_config.yaml

train-fusion:  ## Train the cross-attention fusion model
	$(PYTHON) ml/training/train_fusion.py --config ml/configs/fusion_config.yaml

eval:  ## Run full evaluation suite and write results to ml/evaluation/results/
	$(PYTHON) ml/evaluation/evaluate_all.py

# ---------- Build / Deploy ----------
build:  ## Build all Docker images
	docker compose build

push:  ## Push images to GHCR (requires GITHUB_TOKEN)
	docker compose push

deploy-k8s:  ## Apply Kubernetes manifests
	kubectl apply -k deployment/kubernetes/overlays/staging

clean:  ## Stop containers and remove volumes
	docker compose down -v --remove-orphans
