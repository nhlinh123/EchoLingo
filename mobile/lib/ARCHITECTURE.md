# Mobile Architecture

EchoLingo mobile uses a lightweight clean architecture split:

- `features/*/` for UI feature modules.
- `features/quotes/domain/` for entities + repository contracts.
- `features/quotes/data/` for data source/repository implementation.
- `features/quotes/application/` for use-case/service orchestration.
- `shared/` for reusable UI primitives and constants.
- `core/` for platform/integration concerns (Supabase bootstrap/config).
