# LevelUP API Integration Guide (Frontend Consumption)

This document details how to consume the Core API to implement the learner's progression journey.

## 1. The Learning Journey Flow

### Phase A: Enrollment & Initiation
- **Endpoint**: `POST /programs/enroll`
- **Payload**: `{ "learner_id": "...", "blueprint_id": "..." }`
- **Frontend Action**: Create a "Start Learning" button that triggers this. The response contains the `PersonalProgram` which should be used to render the learning map.

### Phase B: Activity Engagement
- **Endpoint**: `POST /activities/start`
- **Payload**: `{ "node_id": "..." }`
- **Frontend Action**: When a user clicks a node in the map, start the activity. This returns an `ActivityInstance`. Use its data to render the activity content.

### Phase C: The Socratic Loop (The "Brain")
- **Endpoint**: `POST /assessments/:id/coach`
- **Payload**: `{ "user_input": "..." }`
- **Frontend Action**: Implement a chat interface. 
    - The `id` comes from the `AssessmentSession` created when the activity is completed.
    - Display the coach's response in a chat bubble.
    - **Note**: If the API returns a 400 "Violation", show a message like: *"The coach is refining the question to better guide you..."*

### Phase D: Evidence Submission
- **Endpoint**: `POST /assessments/:id/evidence`
- **Payload**: `{ "evidence": {...}, "evaluations": [...] }`
- **Frontend Action**: Provide a way to upload/link evidence (files, URLs, screenshots). The frontend must ensure the evidence is signed (per Axiom A8) before sending.

### Phase E: Progress & Analytics
- **Endpoint**: `GET /learners/:id/progress` $\to$ Overall mastery and confidence.
- **Endpoint**: `GET /analytics/report` $\to$ Detailed performance metrics.
- **Frontend Action**: Render a dashboard with a mastery gauge and a progress chart.

## 2. State Management Suggestions
- **Global State**: Store the current `activeSessionId` and `learnerId`.
- **Optimistic Updates**: Update the learning map node status to "Completed" immediately after a successful assessment closure.

## 3. Architectural Axioms Reminder for Frontend
- **Rigor over Speed**: Ensure the user cannot bypass the Socratic coach to reach the evidence submission without interacting.
- **Evidence-Based**: Never mark a competency as "Mastered" without a corresponding `Evidence` object and a `Closed` session.
