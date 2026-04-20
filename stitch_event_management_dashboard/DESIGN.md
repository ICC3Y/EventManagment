# Design System Document: The Cinematic Editorial

## 1. Overview & Creative North Star
**Creative North Star: The Monochrome Alchemist**
This design system is a study in high-contrast minimalism and tonal depth. By stripping away the distraction of color and focusing on the interplay between pure white (#FFFFFF) and deep, obsidian surfaces (#131313), we create a "Cinematic Editorial" experience. 

The goal is to move beyond the rigid, "boxed-in" feel of standard web applications. Instead, we utilize intentional asymmetry, expansive negative space, and typographic scale to guide the eye. We do not use borders to define space; we use light and shadow. The interface should feel like a high-end physical publication translated into a liquid digital format—authoritative, premium, and remarkably quiet.

---

## 2. Colors
The palette is rooted in a "Noir" philosophy, where the presence of light is intentional and the absence of light defines the structure.

### Core Palette
*   **Primary (#FFFFFF):** Our "Light Source." Reserved for high-impact CTAs, active states, and critical headlines.
*   **Surface (#131313):** The base canvas. A deep, non-pure black that provides enough warmth to prevent eye strain while maintaining maximum contrast.
*   **Secondary/Muted (#C6C6CB):** Used for inactive navigation elements and secondary information, providing a clear hierarchy between the "active" white and the "passive" grey.

### The "No-Line" Rule
To maintain a bespoke feel, **1px solid borders are strictly prohibited for sectioning.** Conventional "boxes" make an app feel like a template. Boundaries must be defined through:
1.  **Background Shifts:** Transitioning from `surface` (#131313) to `surface-container-low` (#1B1B1B).
2.  **Tonal Transitions:** Using `surface-container-highest` (#353535) for distinct interactive zones.

### Surface Hierarchy & Nesting
Treat the UI as a physical stack of materials.
*   **Base:** `surface` (#131313)
*   **Floating Elements:** `surface-container` (#1F1F1F)
*   **Interactive Cards:** `surface-container-high` (#2A2A2A)
*   **Nesting Rule:** When placing a container inside another, the inner container must move one step higher in the tier (e.g., a `surface-container-highest` button inside a `surface-container-high` card).

### The "Glass & Gradient" Rule
For hero sections or floating navigation, use **Glassmorphism**. Apply `surface-container` at 70% opacity with a `backdrop-filter: blur(20px)`. To add "soul," use a subtle linear gradient on primary CTAs: `primary` (#FFFFFF) to `primary-container` (#D4D4D4) at a 45-degree angle.

---

## 3. Typography
We utilize **Plus Jakarta Sans** for its modern, geometric clarity and sophisticated tracking.

*   **Display (lg/md):** Used for "Hero" moments. Tighten letter-spacing by -0.04em to give it a dense, editorial feel.
*   **Headline (lg/md/sm):** Reserved for section headers. Use `on-surface` (#E2E2E2) to keep the screen from feeling too "loud."
*   **Body (lg/md):** Our primary reading weight. Use `on-surface-variant` (#C6C6C6) for long-form text to reduce vibration against the dark background.
*   **Labels:** Always uppercase with +0.05em letter-spacing for a technical, precise aesthetic.

---

## 4. Elevation & Depth
In this design system, depth is a product of light, not lines.

*   **The Layering Principle:** Place a `surface-container-lowest` card on a `surface-container-low` section to create a "recessed" or "debossed" look. This creates a tactile, premium feel without visual clutter.
*   **Ambient Shadows:** For floating modals, use a "Double Shadow" technique.
    *   *Shadow 1:* 0px 4px 20px rgba(0, 0, 0, 0.4)
    *   *Shadow 2:* 0px 0px 1px rgba(255, 255, 255, 0.1) (A "rim light" to define the edge).
*   **The "Ghost Border" Fallback:** If a container requires a border for accessibility (e.g., input fields), use the `outline-variant` token at 15% opacity. Never use 100% opacity borders.
*   **8px Radius:** All interactive containers and cards must strictly adhere to the **8px (0.5rem)** border radius to maintain a consistent architectural language.

---

## 5. Components

### Buttons
*   **Primary:** Solid `primary` (#FFFFFF) background with `on-primary` (#1A1C1C) text. High contrast, no border.
*   **Secondary:** `surface-container-highest` (#353535) background. Provides a subtle "lift" from the page.
*   **Tertiary:** Transparent background with `primary` text. Use for low-priority actions.

### Navigation
*   **Active State:** `primary` (#FFFFFF) text or icon. 
*   **Inactive State:** `secondary` (#C6C6CB) or `on-surface-variant`. This creates a clear focus on the user's current location.

### Input Fields
*   **Styling:** Background of `surface-container-low` (#1B1B1B) with a Ghost Border (15% opacity `outline-variant`).
*   **Focus State:** The border transitions to 100% `primary` (#FFFFFF) with a 2px thickness. No "glow" effects.

### Cards & Lists
*   **No Dividers:** Prohibit the use of horizontal rules (`<hr>`). 
*   **Separation:** Use `surface-container-high` as the card background against a `surface` background. For lists, use 16px or 24px of vertical white space to separate items.

### Tooltips
*   **Styling:** Pure `primary` (#FFFFFF) background with `on-primary` (#1A1C1C) text. They should appear like small light-boxes floating above the dark UI.

---

## 6. Do's and Don'ts

### Do:
*   **Do** use asymmetrical layouts (e.g., a headline pushed 33% from the left) to break the "web" feel.
*   **Do** use "negative space" as a functional element to group items.
*   **Do** ensure that all icons are "Line" style (2px weight) to match the sophistication of Plus Jakarta Sans.

### Don't:
*   **Don't** use pure black (#000000) for backgrounds; it feels "dead" on OLED screens. Use `surface` (#131313).
*   **Don't** use traditional drop shadows that are grey or muddy. Always use a tinted shadow or a "Ghost Border."
*   **Don't** use "Purple" or any other accent color. The presence of any color other than White, Black, and Grey breaks the "Cinematic Noir" intent.
*   **Don't** use 1px solid dividers. If you must separate content, use a 1px gap that exposes the background color behind it.