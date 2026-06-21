# CompanyOS

CompanyOS is a multi-tenant SaaS platform for managing companies, users, roles, and internal operations.

## Tech Stack
- Ruby on Rails
- PostgreSQL
- Tailwind CSS
- esbuild
- RSpec

## Core Features (MVP)
- User authentication (Devise)
- Multi-company support (tenants)
- Role-based access control (manual RBAC)
- Basic dashboard

## Setup

```bash
bundle install
bin/rails db:create db:migrate
bin/dev
>>>>>>> 01a1203 (Initial Rails application setup with base docs)
