SecureShut is a mobile security application designed to protect a smartphone from unauthorized access when it is stolen, snatched, or forcefully used.

When an intruder tries to power off or misuse the device, SecureShut tricks the attacker by displaying a fake shutdown screen, making them believe the device has been successfully turned off.
In reality, the device remains active in the background and silently performs security actions.

At the same moment, the app:

Captures a front camera image of the person trying to access the device

Fetches the current location

Collects battery status

Sends all this information via SMS to a pre-saved SOS contact number

This allows the device owner to identify the intruder and track the stolen device, even without internet access.

🎯 Core Objectives

Prevent unauthorized device shutdown

Fool intruders using a fake power-off screen

Capture evidence during theft attempts

Send real-time alerts to trusted contacts

Enable device tracking after theft

🚨 How SecureShut Works (Concept Flow)

Device is snatched or accessed without permission

Intruder tries to power off the phone

SecureShut shows a fake shutdown screen

App runs silently in background

Front camera captures intruder’s photo

Device location and battery level are fetched

SMS is sent to SOS contact containing:

Intruder photo

Live location

Battery percentage

Owner can track and take action

✨ Features
Implemented / In Progress

Permission management screen

Clickable permission blocks

Accessibility, Camera, Location, Microphone setup

Clean and simple UI

Planned Features

Fake shutdown screen simulation

Background camera capture

SMS alert system

SOS contact management

Battery & location tracking

Device admin & accessibility protection

Auto-trigger on power button misuse

🛠️ Tech Stack

Flutter

Dart

Android

permission_handler

Android Accessibility Services

Device Admin APIs (planned)

SMS & Location services
lib/
 ├── screens/
 │    └── add_permission_screen.dart
 ├── widgets/
 │    └── permission_item.dart
 └── main.dart
