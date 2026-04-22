# EchoLingo Mobile

This repository contains **mobile-only Flutter code** for EchoLingo.
Backend/API is expected to be provided by **Supabase**.

## Structure

- `mobile/lib/features/*`: feature-based modules (home/review/learn/collection/profile/settings + quotes domain/data/application).
- `mobile/lib/shared/*`: shared/common widgets and constants.
- `mobile/lib/core/supabase/*`: Supabase config + bootstrap.
- `specs/echolingo-product-spec.json`: canonical product specification.

## Run mobile app

```bash
cd mobile
flutter pub get
flutter run \
  --dart-define=SUPABASE_URL=YOUR_SUPABASE_URL \
  --dart-define=SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

## Implemented

- Google SSO entry UI flow gate.
- Bottom-tab navigation: Home, Review, Learn, Collection, Profile.
- Feature modules split into smaller reusable components and a quote service layer (domain/data/application).
- Shared/common UI primitives (`AppSectionTitle`, `MetricTile`, spacing constants).
- Supabase bootstrap wiring (`supabase_flutter`) via `--dart-define` config.
