# Multi-Tenancy Design

## Concept
Each company acts as a tenant. Data is isolated per company.

## Models

### User
- Can belong to many companies

### Company
- Owns all data within it

### Membership
- Joins User ↔ Company
- Stores role (admin, manager, member)

## Data Isolation Rule
All queries must be scoped:

Example:
- current_company.users
- current_company.projects

## Access Rule
A user can only access data through a company they belong to.