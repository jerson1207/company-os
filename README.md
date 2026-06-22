# CompanyOS

CompanyOS is a multi-tenant SaaS platform for managing companies, users, roles, and internal operations.

## Tech Stack
- Ruby on Rails
- PostgreSQL
- Tailwind CSS
- esbuild
- RSpec

## Core Features (MVP)

### Phase 1 (Completed)
- User authentication (Devise)
- Sign up / Sign in / Sign out
- Password recovery (Devise)
- Basic Tailwind UI for auth pages
- RSpec test setup (request specs)
- FactoryBot test data setup

### Phase 2 (Planned)
- Multi-company support (multi-tenancy)
- Role-based access control (RBAC)
- Company-based data isolation
- Dashboard system

## Setup

```bash
bundle install
bin/rails db:create db:migrate
bin/dev
>>>>>>> 01a1203 (Initial Rails application setup with base docs)
