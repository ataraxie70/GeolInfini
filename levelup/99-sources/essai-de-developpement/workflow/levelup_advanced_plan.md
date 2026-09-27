# LevelUP: Advanced Integration & UX Alignment Plan

This document outlines the roadmap to elevate the LevelUP learning platform from a basic set of dashboards into a highly cohesive, professional, and gamified experience centered around **Intelligent Constraints** and **Accountability**.

---

## 1. UI/UX Coherence & Loop Elimination
Currently, the navigation structure can create a feeling of loops (e.g. users getting bounced between dashboard, sessions, and locked states without clear calls to action, or clicking sub-navigation links that redirect to unrelated pages).

### Concrete Actions:
1. **Unify Sub-Navigation**: 
   - Align the sub-navigation bar on the Dashboard with actual application routes.
   - `Daily Overview` $\rightarrow$ [dashboard/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/dashboard/page.tsx)
   - `Active Courses` $\rightarrow$ [curriculum/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/curriculum/page.tsx)
   - `Discipline Score` $\rightarrow$ [discipline/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/discipline/page.tsx)
   - `Device Settings` $\rightarrow$ [devices/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/devices/page.tsx)
2. **Context-Aware Dashboard Actions**:
   - If the user has an active session, display a high-priority "Active Session Banner" that leads directly to the timer.
   - If they have no session, provide a single, clean "Plan Session" button that suggests the next logical prerequisite topic to study.
3. **Interactive Dropdowns (`⋮` menus)**:
   - Make card action buttons (`⋮` and `...`) active by opening context menus.
   - Include options: *Configure Goals*, *View Detailed History*, and *Quick Replan*.

---

## 2. Real Notification System
Replace the static `🔔 3` badge with a dynamic, real-time alert feed, keeping the learner informed of system actions.

### Concrete Actions:
1. **Interactive Dropdown Panel**:
   - Clicking the bell icon on the top header will toggle a glassmorphism dropdown listing the last 5 events (e.g., penalties applied, auto-reschedules, rewards earned).
   - "Mark as Read" action to clear the indicator.
2. **Dedicated Notification Page**:
   - Add a `/notifications` route presenting a detailed history of system actions (such as automated nightly cron penalties or local daemon sync logs).

---

## 3. Systems Integration (Daemon Logs)
Improve user awareness of local activity tracking to build trust in the automated discipline score calculations.

### Concrete Actions:
1. **Active Device Monitor on Dashboard**:
   - Show a live indicator on the dashboard (e.g., "Active Tracker: Online" or "Offline") based on the device's `lastSeen` timestamp.
2. **Deep Work Summary**:
   - Include a card showing the total focus minutes tracked by the local agent daemon today, detailing processes (like `rustc`, `vim`, `tmux`) contributing to the discipline rewards.

---

## 4. Implementation Timeline

| Phase | Feature | Target File(s) | Status |
| :--- | :--- | :--- | :--- |
| **Phase 1** | Safety Fixes | [discipline/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/discipline/page.tsx) | Complete ✅ |
| **Phase 2** | Interactive Menus & Subnav Unification | [dashboard/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/dashboard/page.tsx) | In Progress 🔄 |
| **Phase 3** | Notification Dropdown & dedicated page | [layout.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/layout.tsx) / `/notifications` | Planned 📅 |
| **Phase 4** | Live Daemon Status indicator | [dashboard/page.tsx](file:///home/oswiser9/Out-Labs/www/levelUP/apps/frontend/src/app/(dashboard)/dashboard/page.tsx) | Planned 📅 |
