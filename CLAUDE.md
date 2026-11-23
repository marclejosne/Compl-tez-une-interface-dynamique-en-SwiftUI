# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

"Taj Mahal" is an OpenClassrooms iOS course project ("Complétez une interface dynamique en SwiftUI"): a SwiftUI app for an Indian restaurant with a welcome screen and a menu. The starter code was provided by the course; the student's task is to complete the UI. Code comments, UI strings and commit messages are in French.

## Build

Single Xcode project, no package manager, no test target, no linter.

```sh
# Build for the simulator (run from repo root)
xcodebuild -project TajMahal/TajMahal.xcodeproj -scheme TajMahal \
  -destination 'platform=iOS Simulator,name=iPhone 18 Pro' build
```

Deployment target is iOS 16.0 — avoid iOS 17+-only APIs (e.g. `@Observable`, `ContentUnavailableView`) unless guarded with `#available`.

The project uses classic Xcode groups (objectVersion 56), not synchronized folders: new `.swift` files must be registered in `TajMahal.xcodeproj/project.pbxproj` (PBXFileReference, PBXBuildFile, group children, Sources build phase) or they will not compile into the target.

## Architecture

Simple MVVM, all under `TajMahal/TajMahal/`:

- `Model.swift` — `Dish` struct and `SpiceLevel` enum (`light`/`medium`/`hot`).
- `ViewModel.swift` — a plain `struct ViewModel` holding hardcoded data: `apetizerArray` (sic) and `mainCourseArray`. No networking or persistence.
- `TajMahalApp.swift` — entry point, launches `WelcomeView`.
- `Views/WelcomeView.swift` — home screen inside a `NavigationStack`; `NavigationLink` pushes `MenuView`.
- `Views/MenuView.swift` — menu `List` built from the view model (in progress).
- `ContentView.swift` — unused Xcode template leftover.

Resources are referenced by string name, so typos fail silently at runtime:

- Images in `Assets.xcassets`: `Dish.imageName` must match an imageset name exactly (some contain spaces, e.g. `"Tikka Masala"`, `"Rogan Josh"`).
- Brand color: `Color("CustomRed")` (also used for the launch screen in `Info.plist`).
- Font: Plus Jakarta Sans, registered in `Info.plist` under `UIAppFonts`; use via `Font.custom("PlusJakartaSans-<Weight>", size:)` with weights ExtraLight, Light, Regular, Medium, SemiBold, Bold, ExtraBold.
