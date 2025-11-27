---
description: Clean up a waffle flag/switch from the Django codebase using JIRA ticket context
argument-hint: [JIRA-TICKET-ID or URL]
---

# Waffle Flag/Switch Cleanup Command

You are tasked with cleaning up a waffle flag or switch from the Django codebase.

## Input Parameters
- JIRA ticket ID or URL: $1

## Process

### 1. Extract Ticket ID
- If $1 is a full JIRA URL (e.g., https://yoursite.atlassian.net/browse/PDW-12345), extract the ticket ID from it
- If $1 is already just a ticket ID (e.g., PDW-12345), use it directly
- The ticket ID format is typically: PROJECT-NUMBER (e.g., PDW-12345)

### 2. Gather Context from JIRA
- Fetch the JIRA ticket details using the MCP tool with the extracted ticket ID
- Extract the following information:
  - Waffle flag/switch name
  - Latest state (ON or OFF)
  - Duration it has been in that state
- If any of this information is missing from the ticket, ask the user to provide it

### 2. Find All Waffle Usage
- Search the codebase for ALL occurrences of the waffle flag/switch name
- Check for usage in:
  - Python code (if statements, waffle.flag_is_active, waffle.switch_is_active, etc.)
  - Template files
  - JavaScript/frontend code
  - Configuration files
  - Test files
  - Documentation

### 3. Determine Code to Keep
Based on the latest waffle state:
- If **ON**: Keep the code inside the "if waffle is active" block, remove the "else" block and the conditional
- If **OFF**: Keep the code inside the "else" block (if exists) or remove the entire conditional block, remove the "if waffle is active" block

### 4. Update Code
- Remove the waffle conditional logic
- Keep only the appropriate code path based on the final state
- Ensure proper indentation and code structure after removal
- Remove any unused imports related to waffle

### 5. Update Tests
- Find all tests related to the modified code
- Update tests to remove waffle-specific test cases
- Ensure the remaining behavior is fully covered with 100% coverage
- Run tests for the modified files to verify they pass

### 6. Code Quality
Run code quality tools:
```bash
COMPOSE_COMPATIBILITY=1 docker compose run --rm django-ca ruff format --config pyproject.toml .
COMPOSE_COMPATIBILITY=1 docker compose run --rm django-ca ruff check --fix --config pyproject.toml .
```

### 7. Verify Tests Pass
Run the test suite for affected areas:
```bash
COMPOSE_COMPATIBILITY=1 docker compose run --rm django-ca pytest <path_to_modified_tests> -v
```

### 8. Create Pull Request
- Use the `git-pr-workflow` agent to create a pull request
- The PR title should be: "$1 Remove waffle flag/switch: [flag_name]"
- Use `.github/PULL_REQUEST_TEMPLATE.md` as the template
- In the PR description, include:
  - Summary of what waffle was removed and its final state
  - List of all files modified
  - Explanation of which code path was kept and why
  - **Testing instructions** that show:
    - How to verify the behavior BEFORE the waffle removal (what was the expected behavior)
    - How to verify the behavior AFTER the waffle removal (should be the same as the final waffle state)
    - Specific test cases or manual testing steps

## Important Notes
- **DO NOT** create a database migration to remove the waffle from the database
- Ensure 100% test coverage on all modified code
- Be thorough in searching for ALL occurrences of the waffle flag/switch
- Double-check that the correct code path is being kept based on the final state
- The work is complete only when:
  1. All waffle references are removed from the codebase
  2. Tests are updated and passing with full coverage
  3. Code quality checks pass
  4. Pull request is created with the git-pr-workflow agent

## Workflow Summary
1. Fetch JIRA ticket → Extract waffle details
2. Search codebase → Find all waffle occurrences
3. Analyze code → Determine what to keep/remove
4. Update code → Remove waffle conditionals
5. Update tests → Ensure 100% coverage
6. Run quality checks → ruff format & check
7. Verify tests → Run pytest
8. Create PR → Use git-pr-workflow agent with testing instructions
