# Design System Document: The Midnight Curator

## 1. Overview & Creative North Star
This design system is built to transform event management from a utility into an editorial experience. The Creative North Star is **"The Midnight Curator."** 

Unlike standard event platforms that rely on rigid grids and clinical borders, this system treats the UI as a premium gallery. We move away from the "template" look by utilizing intentional asymmetry, deep tonal layering, and high-contrast typography. By using a true-black base (#000000) paired with vibrant purples and soft yellows, we create an atmosphere that feels like an exclusive backstage pass—sophisticated, energetic, and highly intentional.

---

## 2. Colors & Surface Philosophy
The palette is rooted in a deep, obsidian environment where light is used as a functional tool rather than just decoration.

### The Color Tokens
- **Background:** `#0e0e0e` (Base) | `surface_container_lowest`: `#000000` (Deepest depth)
- **Primary (Accent):** `#db90ff` (Vibrant Purple) — Used for active states and brand moments.
- **Tertiary (Status):** `#ffe07d` (Soft Yellow) — Reserved for highlights and status tags.
- **Surface Tiers:** Use `surface_container_low` (`#131313`) through `surface_container_highest` (`#262626`) to define priority.

### The "No-Line" Rule
To achieve a high-end editorial feel, **1px solid borders are strictly prohibited for sectioning.** Boundaries must be defined solely through background color shifts or negative space. 
- *Implementation:* A card using `surface_container_low` sits directly on a `surface` background. The difference in tonal value is the only "line" the user needs.

### Signature Textures
- **The Glass Rule:** Floating elements, such as the bottom navigation or modal overlays, must use Glassmorphism. Apply `surface` colors at 60-80% opacity with a `20px` to `40px` backdrop-blur.
- **Vibrant Gradients:** Primary CTAs should not be flat. Use a subtle linear gradient from `primary` (`#db90ff`) to `primary_container` (`#d37bff`) at a 135-degree angle to add "soul" to the interactive elements.

---

## 3. Typography
We use **Plus Jakarta Sans** for its modern, geometric clarity and bold presence. 

- **Display (Display-LG/MD):** Use for "hero" event titles. These should feel like magazine headlines—tight letter spacing (-2%) and bold weights.
- **Headlines (Headline-SM):** Used for section titles (e.g., "Upcoming Events"). This drives the "Editorial" feel.
- **Labels (Label-MD/SM):** Reserved for metadata like time, location, and status. 
- **Hierarchy Logic:** The contrast between a `display-sm` event title and a `label-sm` timestamp creates an authoritative hierarchy that guides the eye without the need for icons or bullets.

---

## 4. Elevation & Depth
In this design system, depth is achieved through **Tonal Layering**, not structural lines.

### The Layering Principle
Think of the UI as stacked sheets of fine, dark paper. 
- **Level 0 (Background):** `#0e0e0e`
- **Level 1 (Sections):** `surface_container_low` (`#131313`)
- **Level 2 (Cards):** `surface_container` (`#191919`)
- **Level 3 (Interactive/Floating):** `surface_bright` (`#2c2c2c`)

### Ambient Shadows
Shadows must be invisible but felt. When a card requires a "floating" effect, use an extra-diffused shadow:
- **Blur:** 32px
- **Spread:** -4px
- **Opacity:** 8% of `on_surface` (#ffffff)
- **Color:** Tint the shadow with a hint of `primary` to make the glow feel like it’s reflecting off the black surface.

### The "Ghost Border" Fallback
If a container requires more definition (e.g., a search input), use a **Ghost Border**: the `outline_variant` token at 15% opacity. Never use 100% opaque borders.

---

## 5. Components

### Cards & Lists
- **Layout:** Use `xl` (1.5rem) corner radius for main event cards to create a soft, premium feel. 
- **Separation:** Forbid the use of divider lines between list items. Use `24px` of vertical white space or a subtle shift from `surface_container_low` to `surface_container` to separate items.
- **Horizontal Lists:** Ensure cards have "bleed" (they should cut off at the screen edge) to signal horizontal scroll, maintaining the editorial flow.

### Custom Bottom Navigation
- **Styling:** A floating pill shape using the Glassmorphism rule.
- **Active State:** The active icon should be `primary` (`#db90ff`) with a soft glow (shadow) of the same color. Non-active icons should stay `on_surface_variant` (`#ababab`).
- **Radius:** Use `full` (9999px) for the container.

### Status Tags (Chips)
- **Soft Yellow Tag:** Use `tertiary` (`#ffe07d`) background with `on_tertiary_fixed` (`#423500`) text for status tags like "Free" or "VIP." 
- **Shape:** Use `md` (0.75rem) rounding for a modern "lozenge" look.

### Buttons
- **Primary:** Gradient fill (`primary` to `primary_container`), `full` rounded corners, and `title-sm` bold typography.
- **Secondary:** Transparent background with a "Ghost Border" (15% opacity `outline_variant`).

---

## 6. Do's and Don'ts

### Do:
- **Do** use aggressive white space. If a section feels crowded, double the padding.
- **Do** overlap elements. Let an event tag slightly overlap the event image to create physical depth.
- **Do** use `on_surface_variant` (#ababab) for secondary text to maintain the dark, atmospheric mood.

### Don't:
- **Don't** use pure white (#ffffff) for large blocks of text; it causes "halving" (visual vibration) on pure black. Use `on_surface` or `on_surface_variant`.
- **Don't** use standard Material shadows. They are too "heavy" for this high-end aesthetic. Stick to Tonal Layering.
- **Don't** use icons as the primary way to communicate. Let the typography and color (Purple vs. Yellow) do the heavy lifting.
- **Don't** use sharp corners. Every container must have at least a `sm` (0.25rem) radius, with cards preferring `lg` (1rem) or `xl` (1.5rem).