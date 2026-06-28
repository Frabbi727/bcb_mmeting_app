# BCB Meeting App (Base Flutter Project)

A robust Flutter base project configured with **GetX**, **Dio**, **GetStorage**, and **json_serializable** code generation. The codebase strictly follows the **MVVM architecture pattern** and **SOLID design principles**, offering multi-environment builds, centralized state management, dynamic M3 typography/theming, and type-safe translations.

---

## 📂 Folder Structure

The project structure is organized as follows:

```
lib/
├── core/                  # Core constants, themes, routing, and configurations
│   ├── bindings/          # App-wide global dependency bindings
│   ├── routes/            # GetX AppPages and AppRoutes
│   ├── theme/             # Material 3 colors, custom themes, and typography scale
│   ├── values/            # Global constants, dimen values, and translations
│   └── widgets/           # Global reusable UI widgets (e.g., CustomAppBar)
│
├── data/                  # Data access layer (Decoupled from ViewModels)
│   ├── dao/               # Network query interfaces (BaseDao, UserDao)
│   ├── local/             # Local session persistence and cache interface (GetStorage)
│   ├── models/            # Serialization data models (UserModel)
│   └── network/           # API Client setup, auto-refresh JWT interceptors, and error handlers
│
└── features/              # Feature directories following MVVM pattern
    ├── home/              # View, Controller, Repository, Bindings
    ├── login/             # View, Controller, Repository, Bindings
    ├── main_nav/          # Tab routing, Dynamic shell navigation
    ├── profile/           # View, Controller, Repository, Bindings
    ├── set_meeting/       # View, Controller, Repository, Bindings
    └── splash/            # View, Controller, Bindings
```

---

## 🛠️ Tech Stack & Features

*   **State Management**: [GetX](https://pub.dev/packages/get) for fast navigation, dependency injection, and reactive states.
*   **Networking**: [Dio](https://pub.dev/packages/dio) with automated JWT authorization header injection, request logger interceptors, and **transparent auto-refresh token logic** on `401 Unauthorized`.
*   **Persistent Storage**: Wrapper over [GetStorage](https://pub.dev/packages/get_storage) for synchronous, light-weight session, token, theme, and language caching.
*   **Architecture Pattern**: decoupled MVVM (Bindings -> Views -> ViewModels -> Repositories -> DAOs).
*   **Error Handling**: Sealed state wrapper (`Resource<T>`) for clean, compiler-enforced success/error parsing.
*   **Serialization**: Automated `@JsonSerializable` code generation.
*   **Design Language**: Full Material 3 support with customized color schemes and M3 Typography scale.

---

## 🚀 Getting Started

### Prerequisites

Ensure you have Flutter SDK installed (supported version: Dart 3+ / Flutter 3.10+).

### Installation

1.  Clone the repository and fetch dependencies:
    ```bash
    flutter pub get
    ```
2.  Generate serializable models (run build runner):
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

### Environments & Running the App

The project supports three environment profiles: **Development**, **Staging**, and **Production**. Use the target files to boot the app:

*   **Development**:
    ```bash
    flutter run -t lib/main_development.dart
    ```
*   **Staging**:
    ```bash
    flutter run -t lib/main_staging.dart
    ```
*   **Production**:
    ```bash
    flutter run -t lib/main_production.dart (or lib/main.dart)
    ```

---

## 🔑 Localization & Languages

Decoupled localization dictionary maps are located in `lib/core/values/`:
*   [`en_us.dart`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/values/en_us.dart) (English)
*   [`bn_bd.dart`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/values/bn_bd.dart) (Bangla)
*   [`es_es.dart`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/values/es_es.dart) (Spanish)

To add new strings:
1.  Add key constants in [`translation_keys.dart`](file:///Users/fazlerabbi/Desktop/Projects/bcb_meeting_app/lib/core/values/translation_keys.dart).
2.  Provide translations inside individual locale maps.
3.  Reference in the UI via `TranslationKeys.yourKey.tr` or `TranslationKeys.yourKey.trParams({...})`.
