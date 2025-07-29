---
type: "always_apply"
---

# Python Guidelines: Key Principles & Code Style

These guidelines ensure code generated or edited by LLMs adheres to high-quality, maintainable, and idiomatic Python practices.

## General Principles

- **Favor early returns**  
  Avoid deep nesting by returning early when conditions are met. It improves readability and reduces unnecessary indentation.

- **Prioritize readability over cleverness**  
  Concise code is ideal—but not at the cost of clarity. Simple, readable logic is preferred over terse one-liners.

- **Avoid unnecessary inline comments**  
  Only add comments when the intention of the code is not obvious. Clean code should be largely self-explanatory.

- **Use docstrings where meaningful**  
  Prefer concise docstrings that describe _why_ something exists or _how_ to use it—avoid restating the obvious.

- **Respect project linting rules (e.g., Ruff)**  
  All generated code must conform to the project’s linting and formatting configuration. No unformatted output.

- **Prefer Pythonic constructs**  
  Follow Pythonic idioms (e.g., list comprehensions, unpacking, `with` statements), but never at the cost of clarity or maintainability.

- Imports
  - **Always place imports at the top of the module**, grouped by standard library, third-party, and local modules.
  - **Avoid inline or function-level imports**, unless required to resolve **circular dependencies**.
  - Do not include unused imports; keep the import list clean and minimal.
