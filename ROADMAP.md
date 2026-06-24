# Project Roadmap

VeriGuard AI's roadmap is organized into research milestones (M) and
product milestones (P). Dates are targets, not commitments.

## Phase 0 — Foundation (Current)
- [x] Repository scaffold, architecture, and documentation
- [x] FastAPI backend with stubbed multi-modal pipelines
- [x] Next.js dashboard skeleton
- [x] Browser extension skeleton (Chrome/Edge, Manifest V3)
- [x] Docker Compose dev environment (Postgres, Redis, Neo4j)
- [x] Research paper template + methodology draft

## Phase 1 — Core Models (M1)
- [ ] Fine-tune DeBERTa-v3 on FakeNewsNet + LIAR + CoAID for claim
      veracity classification
- [ ] Train CLIP-based image-text consistency scorer on Fakeddit
- [ ] Train GraphSAGE/GAT bot & coordination detector on Twitter15/16, PHEME
- [ ] Establish baseline benchmark table (accuracy, F1, AUROC, ECE)

## Phase 2 — Fusion & Explainability (M2)
- [ ] Cross-attention fusion transformer (text + image + graph embeddings)
- [ ] Calibrated final trust score with confidence intervals
- [ ] SHAP + attention-map explainability UI in dashboard
- [ ] Ablation study: late fusion vs. cross-attention vs. hybrid fusion

## Phase 3 — Real-Time Fact Checking (M3)
- [ ] Wikipedia/Wikidata retrieval-augmented verification
- [ ] PolitiFact / Snopes / FactCheck.org connector (where API access
      permits; otherwise scraping guidance only)
- [ ] Claim decomposition + evidence ranking

## Phase 4 — Threat Intelligence (M4)
- [ ] Coordinated campaign detection (temporal + graph clustering)
- [ ] Bot farm detection dashboard
- [ ] Viral cascade prediction

## Phase 5 — Product Hardening (P1)
- [ ] OAuth2 + JWT + RBAC in production mode
- [ ] Rate limiting & abuse protection at the edge
- [ ] PWA offline mode + push notifications
- [ ] Chrome Web Store / Edge Add-ons submission

## Phase 6 — Scale & Cloud (P2)
- [ ] Kubernetes autoscaling (HPA) for inference pods
- [ ] Multi-cloud deployment guides validated on AWS, Azure, GCP
- [ ] Prometheus/Grafana SLO dashboards + alerting

## Phase 7 — Publication (R1)
- [ ] Complete benchmark comparisons against SOTA baselines
- [ ] Submit `paper/paper.tex` to a workshop/conference (e.g., ACL, WWW,
      ICWSM)

---
Have an idea? Open a [feature request](.github/ISSUE_TEMPLATE/feature_request.md)
or start a discussion.
