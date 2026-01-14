# 🔐 SecureShut – Anti-Theft Device Protection App

## 📌 Overview

**SecureShut** is a mobile security application designed to protect smartphones from **unauthorized access during theft or forceful usage**.  
When an intruder attempts to power off or misuse the device, SecureShut **displays a fake shutdown screen** to deceive the attacker while secretly performing security actions in the background.

The app captures critical evidence and sends it to a **pre-configured SOS contact**, helping the owner track and identify the intruder even without internet access.

---

## 🚨 Problem Statement

When a smartphone is stolen or snatched:
- The thief immediately powers off the device
- Tracking becomes impossible
- Personal data is compromised

**SecureShut solves this problem** by preventing real shutdown and triggering hidden security actions.

---

## 💡 Solution

SecureShut:
1. Detects unauthorized power-off attempts
2. Shows a **fake shutdown screen**
3. Keeps the device running silently
4. Captures the intruder’s photo using the front camera
5. Fetches live location and battery status
6. Sends all details via **SMS to SOS contact**

---

## ✨ Key Features

- 🔒 Fake shutdown screen to fool intruders
- 📸 Automatic front camera capture
- 📍 Live location tracking
- 🔋 Battery status reporting
- 📩 SOS alert via SMS
- 🛡️ Accessibility & Device Admin protection
- 📱 Offline functionality (SMS-based alerts)

---

## 🛠️ Tech Stack

- **Flutter**
- **Dart**
- **Android SDK**
- **permission_handler**
- Android Accessibility Services
- Device Admin APIs
- Location & SMS Services

---

## 📂 Project Structure


<pre> ```lib/
├── screens/
│ └── add_permission_screen.dart
├── widgets/
│ └── permission_item.dart
└── main.dart``` </pre>
---

## 🔐 Required Permissions

SecureShut requires the following permissions:

- Camera – capture intruder image
- Location – track device location
- Microphone – security triggers
- Accessibility – monitor power button actions
- Device Admin – block actual shutdown
- SMS – send SOS alerts

---

## ⚙️ Installation Guide

### Prerequisites
- Flutter SDK installed
- Android Studio / VS Code
- Android Emulator or Physical Device

Verify setup:
```bash
flutter doctor 


###▶️ Running the Application

Clone the repository:

git clone https://github.com/your-username/secureshut.git


Navigate to project directory:

cd secureshut


Install dependencies:

flutter pub get


Run the app:

flutter run
```

