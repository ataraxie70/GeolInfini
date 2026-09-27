# Hardened UX/UI Specifications - Secured Community Tontine Platform

This document defines the interface strategy. The design is based on **"Cognitive Accessibility"**: minimizing the mental load for users who are not digitally native.

---

## 1. UX Strategy: The "Trust First" Approach
The interface is not just about beauty, but about **visual proof**.
- **Visual Confirmation**: Every successful action results in a high-visibility green confirmation screen.
- **The Trust Dashboard**: A central screen showing the "Health" of the group:
    - Total money collected vs. Target.
    - Number of members paid.
    - Current turn beneficiary.
- **Action-Oriented Navigation**: Users are guided by a "What's next?" prompt (e.g., "Your turn is in 3 cycles. Pay your contribution now").

---

## 2. Core Interface Specs

### 2.1 The Member's Home (Trust Hub)
- **Header**: Group Name | Current Cycle | My Status (`ACTIVE`).
- **Central Gauge**: A circular progress bar showing the current `TOUR` fund accumulation.
- **Primary Action**: A large, centered button that changes based on state:
    - `Unpaid` $\rightarrow$ **"PAY MY CONTRIBUTION"** (Green).
    - `Paid` $\rightarrow$ **"CONTRIBUTION VALIDATED"** (Checkmark).
    - `Suspended` $\rightarrow$ **"REGULARIZE MY DEBT"** (Amber).
- **The Turn Queue**: A vertical list of members. The current beneficiary is highlighted in gold.

### 2.2 Contribution Flow (Secure Path)
1. **Intent**: User clicks "PAY MY CONTRIBUTION".
2. **Review**: Screen showing: Required Amount | Any Outstanding Debt | Final Total.
3. **Provider Choice**: Icons for Orange Money, MTN, Wave, Bank.
4. **External Trigger**: Secure redirect to provider $\rightarrow$ User enters PIN on provider's side.
5. **Return & Proof**: Return to app $\rightarrow$ "Verifying with Provider..." $\rightarrow$ "Success! Transaction #[ID] recorded."

### 2.3 Governance Interface (Collective Vote)
- **Proposition Card**:
    - Title (e.g., "Swap Turn 4 and 6").
    - Proposer's Name.
    - Countdown timer.
- **Decision Screen**: Three large, color-coded buttons:
    - **YES (Green)**
    - **NO (Red)**
    - **ABSTAIN (Grey)**
- **Post-Vote**: Immediate view of the result bar (e.g., "60% YES - APPROVED").

### 2.4 Audit & Transparency View (The "Glass Box")
- **Event Timeline**: A chronological feed of system events:
    - `[Icon: Money] Member X paid 50,000 FCFA - Validated`
    - `[Icon: Shield] Coverage Fund used for Member Y - 10,000 FCFA`
    - `[Icon: Gavel] Vote on Order Change - Approved`
- **Proof Viewer**: Ability to click a delivery event to view the uploaded photo of the product.

---

## 3. Accessibility & Inclusivity
- **Iconography**: Heavy use of universal symbols (Wallet, Gavel, Truck, Shield) to reduce reliance on text.
- **Multimodal Notifications**: 
    - Push for active users.
    - SMS for basic phones.
    - Voice messages for low-literacy users.
- **Language Support**: Local language translations for all labels.

---

## 4. Visual Style Guide
- **Palette**: 
    - **Success/Trust**: Deep Emerald Green.
    - **Value/Wealth**: Harvest Gold.
    - **Danger/Debt**: Crimson Red.
    - **Background**: Off-white/Light Grey for readability.
- **Typography**: Bold, high-contrast sans-serif. Large numbers for financial values.
