# Mobile Architecture

EchoLingo mobile uses a lightweight clean architecture split:

- `features/*/` for UI feature modules.
- `features/quotes/domain/` for entities + repository contracts.
- `features/quotes/data/` for data source/repository implementation.
- `features/quotes/application/` for use-case/service orchestration.
- `shared/` for reusable UI primitives and constants.
- `core/` for platform/integration concerns (Supabase bootstrap/config).

## Performance + 60fps guidelines

- Keep feature screens alive with `IndexedStack` in shell navigation to avoid expensive re-creation when switching tabs.
- Isolate repaint-heavy UI blocks with `RepaintBoundary` (for example quote cards and main tab body).
- Prefer implicit animations (`AnimatedSwitcher`, `AnimatedSize`) with short durations and easing curves for smoothness without complex controller management.
- Reset only local state on filter changes (avoid full screen recompute patterns).
- Keep quote/domain access in application-layer services (`QuoteService`) and avoid loading data repeatedly inside `build()` when it can be cached in state.
