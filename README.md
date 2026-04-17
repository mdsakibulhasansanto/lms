# LMS - Ready LMS

## Overview
Ready LMS is a Flutter mobile learning app prototype with onboarding, role selection, authentication, and a tab-based dashboard experience. The project uses local SQLite storage for account data and Riverpod for authentication state management.

## Features
- Splash screen with auth-session check and conditional navigation.
- Multi-slide onboarding experience with skip and next actions.
- Role selection screen (Student/Instructor) before authentication.
- Authentication module:
  - Login options screen (social buttons UI + email route)
  - Email login with validation and user-not-found dialog
  - Signup options screen (social buttons UI + email route)
  - Email signup with form validation (name, email, phone, password, terms)
  - OTP verification UI (local length check)
  - Success screen that confirms local session and enters dashboard
- Local user persistence with SQLite (`users` table, unique email, login session flag).
- Dashboard with bottom navigation:
  - Home (course browsing UI)
  - Courses (placeholder)
  - Instructor (placeholder)
  - Activities (placeholder)
  - Settings (placeholder)
- Browse Courses (Home tab):
  - Search field
  - Category tab filters
  - Top-rated and free-course sections
  - Filter side panel (topic/more/price range)

## Tech Stack
- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Riverpod (`flutter_riverpod`)
- **Navigation:** `go_router`
- **Local Database:** SQLite (`sqflite` + `path`)
- **Responsive UI:** `flutter_screenutil`
- **Typography:** `google_fonts`
- **UI Utilities:** `flutter_svg`, `pin_code_fields`, `intl`

## Folder Structure
```text
lib/
|-- main.dart
|-- app.dart
|-- core/
|   |-- router/
|   |-- theme/
|   |-- utils/
|   `-- widgets/
|-- data/
|   `-- local/
|       `-- db_helper.dart
`-- features/
    |-- splash_onboarding/
    |   |-- view/
    |   |-- data/
    |   `-- viewmodel/
    |-- choose_your_role/
    |   |-- view/
    |   |-- data/
    |   `-- viewmodel/
    |-- auth/
    |   |-- data/
    |   |   |-- model/
    |   |   `-- repository/
    |   |-- view/
    |   `-- viewmodel/
    |-- dashboard/
    |   |-- view/
    |   |-- widget/
    |   `-- viwmodel/
    `-- browse_courses/
        |-- data/
        |   |-- model/
        |   `-- repository/
        |-- view/
        `-- viewmodel/
```

## App Flow
1. App starts at `SplashScreen` (`/`).
2. Splash waits 3 seconds, then checks local auth state via Riverpod + SQLite.
3. If authenticated: go to `DashboardScreen`.
4. If unauthenticated: go to onboarding.
5. Onboarding -> role selection.
6. Role selection:
   - Continue -> signup flow
   - "Already have an account" -> login flow
7. Signup flow:
   - Signup options -> signup with email -> OTP screen -> success screen -> session confirmed -> dashboard
8. Login flow:
   - Login options -> login with email -> on success goes to browse courses/home route
9. Dashboard uses bottom navigation to switch between Home/Courses/Instructor/Activities/Settings.

## Installation Guide
### Prerequisites
- Flutter SDK installed
- Dart SDK (bundled with Flutter)
- Android Studio / VS Code with Flutter plugins
- Android emulator or physical device

### Run Locally
```bash
flutter pub get
flutter run
```

### Build APK (optional)
```bash
flutter build apk
```

## Dependencies
### Main Dependencies
- `flutter`
- `cupertino_icons: ^1.0.8`
- `flutter_screenutil: ^5.9.3`
- `intl: ^0.20.2`
- `google_fonts: ^8.0.2`
- `flutter_svg: ^2.2.3`
- `pin_code_fields: ^8.0.1`
- `go_router: ^17.1.0`
- `flutter_riverpod: ^2.5.1`
- `sqflite: ^2.3.3`
- `path: ^1.9.0`

### Dev Dependencies
- `flutter_test`
- `flutter_lints: ^6.0.0`
- `flutter_launcher_icons: ^0.14.4`

## Architecture Explanation
This project follows a **feature-first modular structure** with shared `core` and `data` layers.

- `features/*` contains domain-specific modules (auth, onboarding, dashboard, browse courses, etc.).
- `core/*` contains reusable app-wide concerns (routing, theme, constants, common widgets).
- `data/local` contains shared SQLite database access.

Within `auth`, the code uses a lightweight MVVM-style split:
- **View:** Screens and UI widgets
- **ViewModel/State:** Riverpod `StateNotifier` + `AuthState`
- **Repository:** `AuthRepository` encapsulating persistence logic
- **Model:** `UserModel`

Notes based on current code:
- Local persistence is implemented for auth users/sessions.
- Browse-courses repository/provider files exist but are currently empty.
- Several dashboard tabs are currently placeholder screens.

## Backend / API / Database
- **Database:** Local SQLite database (`lms.db`) with `users` table.
- **Backend/API:** No REST/Firebase backend integration found in the current code.
- **OTP:** Verification screen validates OTP length in UI; no remote OTP service is connected.
- **Network usage:** Home UI loads sample images from public URLs (Unsplash/randomuser).

## Future Improvements
- Connect authentication and OTP flows to a real backend.
- Implement social login actions (Google/Apple).
- Complete placeholder dashboard tabs (Courses, Instructor, Activities, Settings).
- Move hardcoded course data into repository/provider with real API or local cache.
- Add meaningful automated tests (current `test/widget_test.dart` is template code and not aligned with app UI).

## Author / Contact Information
- **Author:** Md Sakibul Hasan Santo
- **Email:** mdsakibulhasanto7@gmail.com
