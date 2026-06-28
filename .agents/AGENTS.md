# BCB Meeting App Development Guidelines

This project follows a strict architectural and styling contract to ensure consistency and reliability. When editing or adding features, conform to the following rules:

---

## 🏗️ Clean Architecture Rules (MVVM + SOLID)

1.  **Feature Structuring**: Every new feature folder inside `lib/features/` must contain:
    *   `*_view.dart` (UI rendering)
    *   `*_controller.dart` (GetX state control and bindings)
    *   `*_repository.dart` (Network/data operations gateway)
    *   `*_binding.dart` (Dependency Injection setup)
    *   *Exception*: If a page performs zero data manipulation (e.g., static screens, navigation shells), the repository file may be omitted.
2.  **Sealed Response Contracts**: Always wrap API return results inside the sealed `Resource<T>` wrapper (e.g., `ResourceSuccess`, `ResourceError`). Parse error messages centrally using `ErrorHandler.getErrorMessage(e)`.

---

## 🎨 Design & Styling Conventions (Material 3)

1.  **Strict Dimension Control**: Do not hardcode double numbers for spacing, padding, margins, or radii. Always use constants from [`AppDimens`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/values/dimens.dart) (e.g., `AppDimens.paddingL`, `AppDimens.radiusM`).
2.  **Material 3 Dynamic Theming**: Always query colors dynamically via theme context:
    *   Use `Theme.of(context).colorScheme.primary` or similar. Do not reference hardcoded color values.
3.  **Typography**: Use style tokens registered in the theme via [`AppTypography`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/theme/app_typography.dart) constants (e.g. `Theme.of(context).textTheme.headlineMedium`).

---

## 🌐 Networking & Routing

1.  **Endpoints decoupling**: Any new api query route must be declared as a constant in [`ApiEndPoints`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/values/api_endpoints.dart).
2.  **Route declarations**: Declare route identifiers in [`app_routes.dart`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/routes/app_routes.dart) and map them to their corresponding binding/view inside [`app_pages.dart`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/routes/app_pages.dart).
3.  **Authentication**: Utilize dynamic header inclusion and the auto-refresh interceptor loop in [`api_interceptors.dart`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/data/network/api_interceptors.dart). Keep the local offline bypass (`admin@example.com` / `password`) active for local showcasing.
