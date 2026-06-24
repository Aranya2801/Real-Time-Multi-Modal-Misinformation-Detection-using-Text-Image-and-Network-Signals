# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.x (main) | :white_check_mark: |

## Reporting a Vulnerability

We take the security of VeriGuard AI seriously — particularly because this
system processes user-submitted URLs, images, and social media content.

**Please do not open public GitHub issues for security vulnerabilities.**

Instead, report vulnerabilities privately via:

- Email: **security@veriguard-ai.dev** (PGP key available on request)
- GitHub: use the "Report a vulnerability" button under the Security tab
  (private Security Advisory)

Include:

- A description of the vulnerability and its impact
- Steps to reproduce (PoC code, request samples, etc.)
- Affected version/commit
- Any suggested remediation

### Response Targets

| Stage                     | Target time      |
| ------------------------- | --------------- |
| Initial acknowledgement   | 48 hours         |
| Triage & severity rating  | 5 business days  |
| Fix or mitigation plan    | 30 days (critical), 90 days (other) |

## Scope

In scope:

- `backend/` FastAPI service (auth, rate limiting, SSRF via `/analyze/url`,
  injection in DB layers)
- `frontend/` Next.js dashboard
- `browser-extension/` content scripts and background workers
- Dependency vulnerabilities (handled also via Dependabot/CodeQL)

Out of scope:

- Vulnerabilities in third-party model weights or upstream datasets
- Denial-of-service via extremely large uploads (already rate-limited;
  please still report if a bypass is found)

## Security Practices in this Project

- **AuthN/AuthZ**: OAuth2 + JWT access/refresh tokens, RBAC for admin routes
- **Rate limiting**: token-bucket per API key / IP (see `app/core/rate_limit.py`)
- **Input validation**: Pydantic v2 schemas on every endpoint
- **SSRF protection**: allow-listed schemes/hosts for `/analyze/url`
  fetching, DNS-rebinding checks, size/time limits
- **Secrets**: never committed; `.env` is gitignored, `.env.example`
  documents required variables
- **Dependency scanning**: GitHub CodeQL + Dependabot (see
  `.github/workflows/codeql.yml`)
- **Container hardening**: non-root users in Docker images, minimal base
  images, pinned digests in production

## Disclosure Policy

We follow coordinated disclosure: once a fix is released, we will credit
reporters (with permission) in `CHANGELOG.md` and a GitHub Security
Advisory.
