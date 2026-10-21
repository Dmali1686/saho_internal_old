---
name: Serene Sanctuary
colors:
  surface: '#fdf7ff'
  surface-dim: '#dfd6ec'
  surface-bright: '#fdf7ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f8f1ff'
  surface-container: '#f3eaff'
  surface-container-high: '#ede5fa'
  surface-container-highest: '#e7dff4'
  on-surface: '#1d1928'
  on-surface-variant: '#4a4452'
  inverse-surface: '#322e3e'
  inverse-on-surface: '#f5eeff'
  outline: '#7b7484'
  outline-variant: '#ccc3d5'
  surface-tint: '#7044be'
  primary: '#5525a2'
  on-primary: '#ffffff'
  primary-container: '#6d41bb'
  on-primary-container: '#dfccff'
  inverse-primary: '#d3bbff'
  secondary: '#7044bd'
  on-secondary: '#ffffff'
  secondary-container: '#ac81fd'
  on-secondary-container: '#40008d'
  tertiary: '#1d447c'
  on-tertiary: '#ffffff'
  tertiary-container: '#385c96'
  on-tertiary-container: '#c1d5ff'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ebdcff'
  primary-fixed-dim: '#d3bbff'
  on-primary-fixed: '#260059'
  on-primary-fixed-variant: '#5728a4'
  secondary-fixed: '#ebdcff'
  secondary-fixed-dim: '#d3bbff'
  on-secondary-fixed: '#260059'
  on-secondary-fixed-variant: '#5728a4'
  tertiary-fixed: '#d7e3ff'
  tertiary-fixed-dim: '#abc7ff'
  on-tertiary-fixed: '#001b3f'
  on-tertiary-fixed-variant: '#20467f'
  background: '#fdf7ff'
  on-background: '#1d1928'
  surface-variant: '#e7dff4'
typography:
  headline-xl:
    fontFamily: Outfit
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Outfit
    fontSize: 26px
    fontWeight: '600'
    lineHeight: 34px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Outfit
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Outfit
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: 0em
  body-lg:
    fontFamily: DM Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: 0em
  body-md:
    fontFamily: DM Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0.01em
  body-sm:
    fontFamily: DM Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 18px
    letterSpacing: 0.01em
  label-lg:
    fontFamily: DM Sans
    fontSize: 15px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-md:
    fontFamily: DM Sans
    fontSize: 13px
    fontWeight: '500'
    lineHeight: 18px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: DM Sans
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
    letterSpacing: 0.04em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1.25rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system is tailored for an operational mobile environment dedicated to animal welfare, rescue management, and shelter healthcare workflows. The tone conveys empathy, clarity, composure, and quiet competence. Staff work in unpredictable, high-stress physical environments; the digital workspace must serve as a restorative, low-friction sanctuary that prevents cognitive fatigue.

Drawing inspiration from Soft Modernism and Tonal Layering, the interface avoids aggressive visual noise and clinical sterility. Surfaces appear pillowy, spacious, and tactile without drifting into whimsical or childlike motifs. Layouts employ generous breathing room, comfortable thumb-reach hit targets, and precise typographic hierarchy. The visual language pairs a calming lilac and deep-violet foundation with soft, pastel-coded statuses that communicate urgency without inducing panic.

## Colors

The palette centers on calming violet tones accented by functional pastels designed for rapid clinical and operational triage.

- **Primary (`#6D41BB`)**: Used for key interactions, primary action triggers, active tab indicators, and dominant navigation nodes.
- **Secondary / Container Accent (`#875CD6`)**: Powers interactive toggles, badge fills, elevated button states, and accent highlights.
- **Primary Light (`#EBDDFF`)**: Applied to active states, selected list item highlights, and light container badges.
- **Canvas & Surface Tiering**:
  - Main Background: `#FDF7FF`
  - Soft Surface: `#F8F1FF`
  - Elevated Surface: `#F3EAFF`
  - Floating Card / Top Plane: `#FFFFFF`
- **Typography & Boundaries**:
  - Primary Content / Titles: `#1D1928`
  - Secondary / Supporting Metadata: `#4A4452`
  - Subtle Borders & Dividers: `#CCC3D5`
- **Operational Pastels (Triage & Status)**:
  - Active Treatment / Observation: `#86A8E7` (Periwinkle)
  - Surgery / Intensive Clinical: `#E18AAA` (Rose)
  - Pending / Priority Intake: `#F7B731` (Amber)
  - Discharged / Health Cleared / Complete: `#48C774` (Mint)

Use functional pastels primarily as tinted indicator pills (12–16% fill opacity with solid foreground typography) rather than harsh solid blocks to maintain visual serenity.

## Typography

The type scale combines the architectural warmth of **Outfit** for headings with the pragmatic, highly legible rhythm of **DM Sans** for operational tracking, medical entries, animal identifiers, and form controls.

- **Headings (Outfit)**: Softened geometric architecture creates an approachable, modern identity. Tight letter spacing keeps titles cohesive on mobile viewports.
- **Body & Data (DM Sans)**: High x-height and clear counterforms maintain legibility in fast-paced shelter environments, dimly lit intake bays, or bright outdoor rescue conditions.
- **Numeric & Medical Data**: Dosage quantities, microchip numbers, intake times, and kennel codes use medium and semi-bold weights of DM Sans with tabular figures enabled where possible.

## Layout & Spacing

Designed mobile-first with an emphasis on one-handed ergonomics and clear separation between distinct operational zones:

- **Grid Model**: 4-column fluid mobile grid spanning a default `1.25rem` (20px) outer edge margin with `1rem` (16px) gutters between internal columns.
- **Rhythm & Padding**: All components, cards, and modal bottom-sheets adhere strictly to an 8px spatial grid, with 4px (`space-xs`) reserved for tight internal component paddings.
- **Thumb Zone Optimization**: Primary action controls, quick status switchers, and batch workflow buttons anchor to the bottom 40% of the mobile screen.
- **Tablet / Large Mobile Reflow**: On wider tablet viewports (600px+), layouts transform into a 6- or 8-column split view (e.g., patient list on the left 40%, clinical vitals detail on the right 60%) with margins expanding to `2rem`.

## Elevation & Depth

Visual hierarchy relies on soft surface chromatic stepping paired with low-contrast, lilac-tinted ambient shadows. Avoid dark, cold grey drop shadows entirely.

- **Level 0 (Canvas)**: `#FDF7FF`. The foundational application surface.
- **Level 1 (Sub-section / Recessed Containers)**: `#F8F1FF`. Grouped list containers, search input bars, and secondary grouping zones. No shadow; defined by background value shift.
- **Level 2 (Standard Resting Cards)**: `#FFFFFF`. Clinical cards, kennel profiles, and task modules. Elevated with a soft ambient shadow: `0px 8px 24px -4px rgba(109, 65, 187, 0.06), 0px 2px 6px -1px rgba(109, 65, 187, 0.04)`. Outlined with a delicate hairline: `1px solid rgba(204, 195, 213, 0.45)`.
- **Level 3 (Interactive Active Cards / Floating App Bars)**: `#FFFFFF` or `#F3EAFF`. Lifted elements: `0px 12px 32px -4px rgba(109, 65, 187, 0.10), 0px 4px 12px -2px rgba(109, 65, 187, 0.06)`.
- **Level 4 (Drawers & Action Sheets)**: Elevated modals originating from the screen bottom, supported by a translucent scrim tinted with `#1D1928` at 30% opacity with a slight background blur.

## Shapes

The interface embraces a soft, approachable shape vocabulary ranging from 16px to 24px corner radii, balancing functional utility with gentle tactile softness.

- **Base Radius (`0.5rem` / 8px)**: Reserved for micro elements such as checkboxes, input sub-items, and operational status dots.
- **Standard Component Radius (`1rem` / 16px)**: Applied to input fields, buttons, action chips, and nested inner cards.
- **Container Radius (`1.5rem` / 24px)**: Applied to high-level cards, bottom sheets, animal profile modules, and navigation panels.
- **Pill (Fully Rounded / 9999px)**: Applied to quick-filter status pills, triage chips, notification badges, and floating bottom action buttons.

## Components

### Buttons
- **Primary Button**: Height of 52px for touch ergonomics. Background `#6D41BB`, label Outfit SemiBold 16px in `#FFFFFF`, border-radius 24px. Active/pressed state transitions to `#875CD6` with a slight scale reduction (0.98).
- **Secondary Button**: Background `#EBDDFF`, label `#6D41BB`, no border, border-radius 24px.
- **Tertiary / Ghost Button**: Height 44px, transparent background, label `#6D41BB` or `#4A4452`, border-radius 16px.

### Chips & Status Badges
- **Triage Badges**: Height 28px, pill-shaped. Composed of a 14% tinted pastel background paired with its deep operational text equivalent (e.g., Active Treatment uses background `rgba(134, 168, 231, 0.20)` with text `#3F63A8`).
- **Interactive Filter Chips**: Height 36px, border-radius 9999px. Unselected: background `#FFFFFF`, border `1px solid #CCC3D5`, text `#4A4452`. Selected: background `#6D41BB`, border `1px solid #6D41BB`, text `#FFFFFF`.

### Cards & Patient Enclosures
- Enclosure/Animal profile cards use a `#FFFFFF` surface with `1.5rem` (24px) radius and a delicate `1px solid rgba(204, 195, 213, 0.45)` border.
- Cards maintain 16px internal padding, incorporating an animal thumbnail (48x48px with 16px radius), primary identifier in Outfit SemiBold, and status badge placed at the top-right corner.

### Form Inputs & Selectors
- **Text Fields**: Height 52px, surface `#F8F1FF` in resting state, transitioning to `#FFFFFF` when focused with a 1.5px border in `#6D41BB` and an ambient glow (`rgba(109, 65, 187, 0.12)`). Border-radius 16px. Placeholder text set in `#4A4452` at 60% opacity.
- **Checkboxes & Radios**: 24x24px dimensions to allow easy gloved-hand tapping. Checkbox radius 8px, radio radius fully rounded. Selected state fills with `#6D41BB` featuring a crisp white tick or inner circle.

### Lists & Activity Feeds
- Grouped within `#FFFFFF` cards or floating cleanly over `#FDF7FF`.
- Separators use `#CCC3D5` at 30% opacity, inset by 16px on the leading edge to maintain vertical scanning continuity.

### Specialized Component: Animal Intake Card
- A hero operational card featuring microchip ID, species/breed, behavioral alerts (such as caution flags), medication schedule times, and quick-call vet triggers, styled with an elevated `#F3EAFF` header strip seamlessly integrated into the white base card.