📘 Weather App — Flutter + Provider

A Flutter application that displays the current weather for any city using a Weather API.
Built with Clean Architecture, Provider for state management, and Dio for API requests.

✨ Features

🔍 Search for weather by city name

🌡 Displays:

Temperature

Weather condition (sunny, cloudy, rainy, etc.)

Humidity

Wind speed

🔄 Real-time weather updates from API

📦 State management with Provider

🧩 Organized architecture (Data – Core – Presentation)

📱 Cross-platform: Android, iOS, Web

🧰 Technologies

Flutter

Provider — State management

Dio — HTTP requests

REST API (Weather API)

Clean Architecture principles

🗂 Project Structure
lib/
│
├── core/
│   └── provider.dart        # State management logic
│
├── data/
│   ├── models/
│   │   └── weather_model.dart
│   └── services/
│       └── weather_services.dart
│
├── presentation/
│   └── screens/
│       └── search_screen.dart
│
├── root.dart
└── main.dart

⚙️ Getting Started
1️⃣ Prerequisites

Make sure Flutter is installed:

flutter --version

2️⃣ Install Dependencies
flutter pub get

3️⃣ Run the App
flutter run

🔑 API Key Setup

Open the file:

lib/data/services/weather_services.dart


Replace the placeholder with your API key:

const String apiKey = "YOUR_API_KEY";


You can get an API key from:
OpenWeatherMap

📌 Usage

Open the app

Enter the city name

Tap Search

View current weather conditions 🌦

🚀 Recommendations for Improvement

UI/UX Enhancements: Add animations, gradients, or icons for weather conditions.

Performance: Cache API responses to reduce repeated network calls.

Error Handling: Handle invalid city names, API errors, and offline mode gracefully.

Localization: Support multiple languages (Arabic, English, etc.).

🧑‍💻 Developer

Ziad El Kent
GitHub: https://github.com/ziadel-kent
