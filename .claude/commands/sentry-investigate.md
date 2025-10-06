# /sentry-investigate Command

Investigate and fix production errors in mainsite using plan mode.

## Command Format

```
/sentry-investigate REPO: <repository> TRIGGER: <trigger-type> [ISSUE: <sentry-issue-id>]
```

## Command Execution

1. **Query Sentry** based on parameters:

   **If ISSUE parameter is provided** (e.g., `ISSUE: MAINSITE-2YPN`):

   - Organization: `consumeraffairs`
   - Project: `mainsite`
   - First get issue details to check if it's an error-level issue
   - **STOP IMMEDIATELY** if issue level is not "error"
   - Target: Single specific error-level issue for local testing/debugging

   **If no ISSUE parameter** (automated runs):

   - Organization: `consumeraffairs`
   - Project: `mainsite`
   - Query: `project:mainsite environment:production is:unresolved firstSeen:-24h level:error`
   - Limit: 5 errors to start with

2. **Validate Issue Level** (for specific issue):

   - Use `get_issue_details` to retrieve issue information
   - Check the `level` field in the issue details
   - If level is not "error", stop with appropriate message (see section 5)
   - Only proceed with error-level issues

3. **Create Investigation Plan**:

   - List all errors found with details (issue ID, error message, severity)
   - Analyze each error type and root cause (DO NOT use Sentry's Seer AI tool)
   - **Business context analysis**: Understand the business logic and user workflows involved in the error
   - **Propose simple, concise fixes**: Focus on minimal changes that address the root cause
   - Estimate implementation complexity

4. **For each error in the plan**:

   - Hand off to **sentry debugger agent** with the error data
   - Agent will analyze, implement fix, and create branch/PR

5. **Agent Handoff Format**:

   ```
   Use sentry-debugger agent to fix this Sentry error:
   - Issue ID: {SENTRY-ISSUE-ID}
   - Error: {ERROR-MESSAGE}
   - Stack trace: {STACK-TRACE}
   - First seen: {TIMESTAMP}
   - Fix approach: {PLANNED-APPROACH}
   - Business context: {BUSINESS-LOGIC-AND-USER-WORKFLOW-CONTEXT}
   ```

6. **If no errors found or invalid issue type**:
   - For specific issue not found: "❌ Issue {ISSUE-ID} not found or already resolved"
   - For general search: "✅ No new production errors found in mainsite for the last 24 hours"
   - **If specific issue exists but is not error-level**: "❌ Cannot investigate {ISSUE-ID} - only error-level issues are supported. Issue found with level '{LEVEL}' but investigation requires level 'error'. Non-error issues (performance, transactions, N+1 queries, etc.) have limited context available in Sentry MCP and should be handled through different workflows."

## Usage Examples

**Local testing on specific issue:**

```
/sentry-investigate REPO: consumeraffairs/consumeraffairs TRIGGER: manual ISSUE: MAINSITE-2YPN
```

**Automated daily run:**

```
/sentry-investigate REPO: consumeraffairs/consumeraffairs TRIGGER: automated
```

Begin investigation and create plan.
