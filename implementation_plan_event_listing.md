# Implementation Plan - Event Listing Page

## Objective
Replicate the Event Listing Page from the React Native codebase (`./kin`) to Flutter (`./lib`), ensuring a 1:1 pixel-perfect match.

## Steps Taken

1.  **Analyzed React Native Code**:
    *   Identified the relevant files in `kin/src/app/(app)/(tabs)/(explore)/classes.tsx` (Event Listing Page).
    *   Analyzed components: `EventCard`, `Tag`, `Search`, `FilterRow`.
    *   Analyzed styles: `colors.ts`, `fonts.ts`.
    *   Analyzed data: `events.ts`.

2.  **Asset Migration**:
    *   Copied images from `kin/src/assets/images` to `assets/images`.
    *   Copied temp assets from `kin/src/assets/temp` to `assets/temp`.
    *   Verified `pubspec.yaml` includes these directories.

3.  **Created Utilities**:
    *   `lib/utils/colors.dart`: Defined `AppColors` matching `colors.ts`.
    *   `lib/utils/events_data.dart`: Ported `events` data.

4.  **Created Widgets**:
    *   `lib/widgets/tag.dart`: Ported `EventCardTag` with blur effect.
    *   `lib/widgets/event_card.dart`: Ported `EventCard` with overlapping avatars and layout.
    *   `lib/widgets/search_bar.dart`: Ported `Search` component (renamed to `ExploreSearchBar`).
    *   `lib/widgets/filter_row.dart`: Ported `FilterRow` and `FilterButton`.

5.  **Created Screen**:
    *   `lib/screens/event_listing_page.dart`: Implemented the main page with:
        *   Custom Tab Bar ("Kin Classes", "Kin Events").
        *   Search Bar.
        *   Filter Row.
        *   List of Events using `EventCard`.

6.  **Integration**:
    *   Updated `lib/screens/dev_router_screen.dart` to include "Event Listing Page".
    *   Updated `lib/main.dart` to register the `/event-listing` route.

## Verification
*   Verified asset paths and existence.
*   Verified font usage (`SF Pro Display`).
*   Verified color values.
*   Verified layout structure against React Native code.
