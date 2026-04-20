# Stitch Event Management Dashboard - Project Context

## 1. Objective & Design North Star
**Design System: Midnight Curator (Vivid Noir)**
The application is designed to feel like a high-end editorial gallery. It uses a deep obsidian environment where light and color (Vibrant Purple and Soft Yellow) are used as functional highlights.

### Design Principles:
- **Tonal Layering (The "No-Line" Rule):** Avoid 1px borders for sectioning. Use background shifts between `surface` (#0E0E0E), `surfaceContainerLow` (#131313), and `surfaceContainerHighest` (#262626) to define depth.
- **Plus Jakarta Sans:** Geometric clarity with bold headlines and tight letter spacing (-1.0 for display, -0.5 for headlines).
- **Glassmorphism:** Use for floating elements like the Bottom Navigation Bar (40px blur, 60% opacity).
- **Vibrant Accents:** 
  - Primary Purple: `#DB90FF` (Interactive elements/Active states)
  - Tertiary Yellow: `#FFE07D` (Status badges/Free events)

## 2. Project Structure
- `lib/main.dart`: Entry point, global theme configuration, and route generation.
- `lib/theme/app_colors.dart`: Centralized Vivid Noir color palette.
- `lib/screens/`:
  - `dashboard_screen.dart`: "My Events" view with editorial scroll lists.
  - `event_details_screen.dart`: Cinematic event details with a bento grid and schedule timeline.
  - `venue_map_screen.dart`: Interactive venue map with pulsing user marker.

## 3. Implementation Rules
- **Radius:** Strictly use `2xl` (1.5rem) or `xl` (1.0rem) for cards and main containers to maintain the "Midnight Curator" softness.
- **Buttons:** 
  - Primary: Pure white background with black text for maximum contrast.
  - Secondary: `surfaceContainerHighest` background with white text.
- **Navigation:** All core screens should be accessible via the floating glass bottom nav.

## 4. Development Workflow
- **Hot Restart:** Use `R` in the Flutter console to apply changes to the web version.
- **Tests:** Maintain `test/widget_test.dart` to verify dashboard headers and core navigation presence.
