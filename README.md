# 📖 Overview

**Guardian** is a high-reliability, private alert and secure messaging platform built with **Flutter**, designed to empower trusted teams and closed groups with instant emergency signaling and encrypted communication.

The primary engineering focus of this project is to deliver zero-latency broadcast alerts, custom color-coded emergency protocols, and persistent group telemetry across cross-platform mobile environments.

---

## ✨ Core & Enterprise Features

### 🚨 Color-Coded Emergency Protocols
* **Custom Code Triggering:** Users can instantly trigger color-coded security statuses (White, Green, Purple, Orange, Yellow, Silver, Black, Red, Grey, Blue) mapping to specific predefined team emergency protocols.
* **Code Meanings Index:** Integrated repository for team members to quick-reference operational definitions associated with each distress color code.
* **Instant Group Telemetry:** One-tap dispatch mechanism to broadcast critical alerts across all registered group members without UI latency.

### 💬 Broadcast & Secure Messaging Engine
* **Targeted Dispatch:** Send instant group notifications or direct messages to selected recipients or the entire active network ("All Members").
* **Live Network Stats:** Real-time visibility into active network density, tracking connected members and broadcast message counts.
* **Historical Audit Log:** Comprehensive history tracking module to archive, review, and audit previously dispatched alert codes and broadcast messages.

---

## 🖼️ Application Screenshots

| Authentication | Emergency Broadcast | Color Codes Index |
| :---: | :---: | :---: |
| `<img src="assets/screenshots/guardian_auth.jpg" width="250"/>` | `<img src="assets/screenshots/guardian_send.jpg" width="250"/>` | `<img src="assets/screenshots/guardian_codes.jpg" width="250"/>` |

---

## 🛠️ Production Tech Stack

| Layer | Technology | Engineering Purpose |
| :--- | :--- | :--- |
| **Frontend Framework** | Flutter | Cross-platform, high-performance UI rendering with uniform dark-mode aesthetic. |
| **Language** | Dart | Strongly-typed, sound null-safe execution pipeline. |
| **State Management** | Provider / Bloc | Deterministic, reactive state management for real-time alert and message streams. |
| **Backend & Realtime** | Firebase / Cloud Firestore | Low-latency document synchronization and real-time message broadcasting. |
| **Push Notifications** | Firebase Cloud Messaging (FCM) | High-priority push alert dispatching for immediate crisis delivery. |
| **Local Cache** | SharedPreferences / Hive | Fast-boot offline caching for emergency protocol definitions. |

---

## 🏗️ Architectural Blueprint

The application follows a clean, event-driven architecture designed to isolate emergency dispatch triggers from state propagation:

```text
┌────────────────────────────────────────────────────────┐
│                   Presentation Layer                   │
│       (Dark Theme UI / Code Buttons / Send Console)    │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│             Alert & Messaging State Stream             │
│        (Dispatch Controller / Active Member Engine)    │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│                   Repository Layer                     │
│       (Emergency Protocol Mapper / History Logger)     │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│            Realtime Backend & Push Engine              │
│       (Firestore DB Streams / High-Priority FCM)       │
└────────────────────────────────────────────────────────┘
