# Role-Based Access Control (RBAC)

## Roles

### admin
- Full control of company
- Manage users
- Delete resources

### manager
- Manage projects and tasks
- Cannot manage users

### member
- Can view and update assigned work only

## Rule System

RBAC is handled via Membership model:

- user + company = membership
- membership.role defines permissions

## Access Logic (manual, no gem)

Example rule:

- if membership.role == "admin" → allow all
- if "manager" → limited management access
- if "member" → read/write assigned resources only