# Contributing to VeriGuard AI

Thank you for considering a contribution to VeriGuard AI — a research-grade,
real-time multi-modal misinformation detection platform. This document
explains how to set up your environment, the standards we hold code and
research contributions to, and how the review process works.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [Ways to Contribute](#ways-to-contribute)
3. [Development Setup](#development-setup)
4. [Project Structure](#project-structure)
5. [Coding Standards](#coding-standards)
6. [ML / Research Contributions](#ml--research-contributions)
7. [Commit & Branch Conventions](#commit--branch-conventions)
8. [Testing](#testing)
9. [Pull Request Process](#pull-request-process)

## Code of Conduct

This project adheres to the [Code of Conduct](CODE_OF_CONDUCT.md). By
participating, you are expected to uphold this code.

## Ways to Contribute

- **Bug reports & fixes** — backend, frontend, extension, or pipelines
- **New detection modules** — additional text/image/graph models
- **Dataset connectors** — loaders for new misinformation datasets
- **Research** — ablations, new fusion strategies, benchmark results
- **Documentation** — guides, diagrams, translations
- **MLOps** — CI/CD, monitoring, deployment templates

Check the [issue tracker](../../issues) for `good-first-issue` and
`help-wanted` labels.

## Development Setup

### Prerequisites

- Python 3.11+
- Node.js 20+
- Docker & Docker Compose
- (Optional) CUDA-capable GPU for training

### Clone & bootstrap

```bash
git clone https://github.com/your-org/veriguard-ai.git
cd veriguard-ai
cp .env.example .env

# Backend
cd backend
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt

# Frontend
cd ../frontend
npm install

# Full stack via Docker
cd ..
docker compose up -d
```

See [docs/installation.md](docs/installation.md) for the full guide.

## Project Structure

```
backend/    FastAPI service + ML pipelines (text, image, graph, fusion)
frontend/   Next.js 14 dashboard (TypeScript, Tailwind, shadcn/ui)
browser-extension/  Manifest V3 extension for Chrome/Edge
ml/         Training, evaluation, and config for all models
paper/      Research paper (LaTeX) and publication draft
datasets/   Dataset download & preparation guides
deployment/ Cloud (AWS/Azure/GCP) and Kubernetes manifests
monitoring/ Prometheus/Grafana configuration
docs/       Architecture, API, deployment, troubleshooting docs
```

## Coding Standards

### Python (backend, ml)

- Formatted with **black** (line length 100) and **isort**
- Linted with **ruff**
- Type-checked with **mypy** (strict on `app/core` and `app/ml`)
- Docstrings: Google style
- Run all checks: `make lint`

### TypeScript / React (frontend, extension)

- **ESLint** + **Prettier**
- Strict TypeScript (`strict: true`)
- Components: functional, hooks-based, colocated styles via Tailwind
- Run: `npm run lint && npm run format:check`

## ML / Research Contributions

If you add or modify a model:

1. Document the **architecture**, **loss function**, and **hyperparameters**
   in `ml/configs/<model>.yaml`.
2. Add an **evaluation script** under `ml/evaluation/` reporting accuracy,
   F1, AUROC, and calibration (ECE).
3. Update `paper/research_methodology.md` and, if relevant,
   `paper/paper.tex` with the new method and an ablation entry.
4. Track experiments with MLflow / Weights & Biases — include the run URL
   in your PR description.
5. Never commit raw datasets or model weights — use DVC pointers.

## Commit & Branch Conventions

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(text-pipeline): add propaganda technique classifier
fix(api): correct rate-limit header on /analyze/url
docs(readme): update benchmark table
research(fusion): add ablation for cross-attention vs late fusion
```

Branch naming: `feat/<short-name>`, `fix/<short-name>`, `research/<short-name>`.

## Testing

```bash
# Backend unit + integration tests
cd backend && pytest -v --cov=app

# Frontend
cd frontend && npm run test

# End-to-end (requires docker compose up)
npm run test:e2e
```

All PRs must pass CI (`.github/workflows/ci.yml`) before review.

## Pull Request Process

1. Fork the repo and create your branch from `main`.
2. Add tests for any new behavior.
3. Ensure `make lint test` passes locally.
4. Update documentation (README, docs/, CHANGELOG.md under "Unreleased").
5. Fill out the PR template completely, including model/benchmark impact
   if applicable.
6. A maintainer will review within 5 business days. At least one approval
   and a green CI run are required to merge.

Thank you for helping build a more trustworthy information ecosystem!
