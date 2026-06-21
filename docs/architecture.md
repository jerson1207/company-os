
---

# 📄 docs/architecture.md

```md
# Architecture Overview

CompanyOS follows a multi-tenant SaaS architecture.

## Core Entities
- User
- Company
- Membership (joins users to companies)

## Design Principles
- Each user can belong to multiple companies
- All data is scoped by company
- RBAC is handled via Membership role
- No external authorization gem used

## Structure
- Models handle business logic
- Controllers handle request flow
- Views use Tailwind for UI