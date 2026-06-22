# Architecture Overview

CompanyOS is a multi-tenant SaaS application built with Ruby on Rails.

---

## Core Entities

### Phase 1 (Completed)
- User

### Phase 2 (Planned)
- Company
- Membership (joins users to companies)

---

## Multi-Tenancy Design (Planned)

- Each user will belong to one or more companies via Membership
- All application data will be scoped by company context
- Company acts as the main tenant boundary for data isolation

---

## RBAC (Planned)

- Role-based access control will be implemented through Membership roles
- Roles:
  - admin
  - member
- No external authorization gem (e.g., Pundit) will be used initially

---

## Design Principles

- Models handle business logic
- Controllers handle request flow
- Views use Tailwind CSS for UI
- Authentication is separated from business logic (handled by Devise only)

---

## Tech Decisions

- Rails chosen for rapid SaaS development and convention-based structure
- PostgreSQL used for relational multi-tenant data modeling
- Devise used for authentication only (not authorization)
- FactoryBot + RSpec used for scalable testing
- Tailwind CSS used for fast UI development and consistency

---

## Authentication Scope

- Devise handles authentication only:
  - Sign up
  - Sign in
  - Sign out
  - Password recovery
- Authorization (RBAC) will be implemented separately in Phase 2

---

## Testing Strategy

- Request specs are used for authentication flows
- FactoryBot provides reusable test data
- RSpec is used for behavior-level testing
- Model and system tests will be introduced in Phase 2+

---

## Current Limitations

- No multi-tenancy implemented yet
- No role-based access control
- No dashboard or business logic features
- Authentication is the only working system so far

---

## Current Status

### Completed (Phase 1)
- Authentication system (Devise)
- RSpec test infrastructure
- FactoryBot setup
- Tailwind-based auth UI

### Upcoming (Phase 2)
- Multi-tenancy system
- Company model
- Membership model
- RBAC system

---

## Structure Philosophy

- Keep core logic in models/services
- Avoid coupling authentication with business logic
- Design for scalability from day one (SaaS-first mindset)

---

## Roadmap

### Phase 1 (Completed)
- Authentication system
- Test infrastructure

### Phase 2 (In Progress)
- Multi-tenancy (Company + Membership)
- RBAC system

### Phase 3 (Future)
- Dashboard system
- Core SaaS features