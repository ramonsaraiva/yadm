---
type: "always_apply"
---

# Django Guidelines

These guidelines ensure that all Django-related code is maintainable, idiomatic, and consistent with the architecture and tooling used in this environment.

## Key Principles

- Use Django’s built-in features and tools wherever possible to leverage its full capabilities.
- Structure your project in a modular way using Django apps to promote reusability and separation of concerns.
- Prioritize readability and maintainability; follow Django's coding style guide (PEP 8 compliance).
- Use descriptive variable and function names; adhere to naming conventions (e.g., lowercase with underscores).

## Views

- Use class-based views (CBVs) for complex views; prefer function-based views (FBVs) for simple logic.
- Keep views light—business logic should live in models, forms, or services.

## ORM and Models

- Use Django’s ORM for all database interactions. Avoid raw SQL unless strictly necessary for performance.
- Keep business logic in models and forms when appropriate.
- Optimize queries using `select_related` and `prefetch_related` when accessing related objects.
- Apply indexing and query optimization strategies as needed.

## Forms and Validation

- Use Django’s `Form` and `ModelForm` classes for handling user input and validation.
- Apply model-level validation where possible.
- Handle validation errors gracefully at the view/form level.

## Templates and REST APIs

- Use Django templates for rendering HTML responses.
- Use Django REST Framework (DRF) serializers for API responses.
- Follow clear RESTful patterns in `urls.py`.

## Middleware

- Use Django middleware for cross-cutting concerns such as logging, authentication, and security.
- Keep custom middleware lightweight and focused.

## Error Handling

- Use Django’s built-in error handling mechanisms (`Http404`, `PermissionDenied`, etc.) at the view level.
- Customize error pages (`404.html`, `500.html`, etc.) to improve user experience.
- Use signals (e.g., `post_save`, `got_request_exception`) to decouple logging and side effects from views.

## Exceptions

- When using `logger` to log catched exceptios, prefer using `logger.execption` instead of `logger.error` because it will automatically add context about the exception that was caught.

## Testing

- Tests should live in a `tests/` folder within each Django app, with filenames like `test_<filename>.py`.
- Test function names should follow the pattern: `test_<method>_<behavior>()`.  
  Example: `test_sum_numbers_negative_numbers()`
- Use `model_bakery.baker.make` to create model instances—never create them manually with the ORM.
- You may omit model imports in tests when using `baker.make('app.ModelName')`.
- Prioritize Django asserts (i.e.: assertLogs) over simple asserts.

## Background Tasks and Caching

- Use **Celery** or **Dramatiq** for background tasks. Prefer Dramatiq for newer projects unless otherwise noted.
- Use **Redis** for caching and as a task queue backend.
- Leverage Django’s cache framework for frequently accessed data.

## Performance Optimization

- Optimize database access with `select_related`/`prefetch_related`.
- Use caching strategies (Redis, Memcached) to reduce load.
- Use async views or background workers for I/O-bound or long-running tasks.
- Optimize static file handling (e.g., WhiteNoise, CDN).

## Security

- Apply Django's built-in protections: CSRF, SQL injection prevention, XSS protection.
- Never trust user input; always validate and sanitize.
- Keep Django and third-party packages updated.

## Project-Specific Commands

For projects in the `src/ca` folder, use the helper script located at `~/.local/bin/ca`:

- `ca magictest` – Run tests
- `ca bash` – Enter a container shell
- `ca migrate` – Apply migrations
- `ca makemigrations` – Create migrations

## Key Conventions

1. Follow Django’s “convention over configuration” principle to reduce boilerplate.
2. Always prioritize security and performance optimization.
3. Maintain a clean, modular, and logical project structure.

---

Refer to the [official Django documentation](https://docs.djangoproject.com/) for details on views, models, forms, security, and advanced usage.
