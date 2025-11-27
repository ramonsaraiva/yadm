---
description: Create a pull request using the git-pr-workflow agent with QA branch as default
argument-hint: [base-branch] [JIRA-ticket-ID-or-URL]
---

Use the git-pr-workflow agent to create a pull request with the following requirements:

1. **Base Branch**: Create the PR against the `{{arg1:qa}}` branch (defaults to `qa` if no argument provided)
2. **Ticket Information**: {{arg2}} - If a JIRA ticket link or ticket ID is provided, fetch the ticket details and use that information to help write the PR description
3. **PR Template**: ALWAYS use the `.github/pull_request_template.md` file from the repository as the base template for the PR description
4. Follow the standard git-pr-workflow process for staging, committing, and creating the PR

Make sure to:
- Read the PR template first and use it to structure the pull request description appropriately
- If a ticket is provided, pull relevant information (summary, description, acceptance criteria, etc.) from JIRA to populate the PR description
