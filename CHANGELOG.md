# Changelog

All notable changes to VeriGuard AI are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- Initial repository scaffold: backend (FastAPI), frontend (Next.js),
  browser extension (Manifest V3), ML pipelines (text/image/graph/fusion).
- Multi-modal fusion architecture (cross-attention + late fusion ensemble).
- GNN models for bot detection, community detection, and propagation
  analysis (GCN, GraphSAGE, GAT).
- Real-time fact-checking service against Wikipedia, Wikidata, and
  fact-checking APIs.
- Explainability module (SHAP-based feature attributions, attention maps).
- Docker Compose stack (PostgreSQL, Redis, Neo4j, MLflow, Prometheus,
  Grafana).
- Kubernetes manifests and cloud deployment guides for AWS, Azure, GCP.
- Research paper template and publication-ready draft.
- Dataset acquisition guides for text, image, and graph misinformation
  datasets.
- CI/CD pipelines (lint, test, build, Docker publish, CodeQL).

### Known Limitations
- Pretrained checkpoints are not bundled (see `models/checkpoints/README.md`)
  — training scripts and configs are provided to reproduce them.
- Reverse image search and some third-party fact-check APIs require keys
  that are not provided (see `.env.example`).

## [0.1.0] - 2026-06-15
### Added
- Project scaffold created.
