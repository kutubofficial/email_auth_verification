# 🔐 Login Signup - Flutter Firebase Authentication

A modern Flutter authentication application built with **Firebase Authentication** and **Cloud Firestore**. The project provides a clean and responsive user interface for user registration, login, email verification, password reset, and authentication state management.

> This project demonstrates Firebase Authentication implementation using reusable widgets and clean, maintainable Flutter code.

---

## ✨ Features

- 🔐 User Registration (Email & Password)
- 🔑 User Login
- 📧 Email Verification
- 🔄 Authentication State Wrapper
- 🔒 Forgot Password
- 🚪 User Logout
- ☁️ Cloud Firestore Integration
- 🎨 Google Fonts UI
- 🖼️ SVG Icons Support
- ♻️ Reusable Custom Widgets
- 📱 Responsive Material Design UI

---

# 📂 Project Structure

```text
lib/
│
├── authentication/
│   ├── login.dart
│   ├── signup.dart
│   ├── forgot_password.dart
│   ├── email_verify.dart
│   └── wrapper.dart
│
├── widgets/
│   ├── custom_text_field.dart
│   ├── main_button.dart
│   ├── social_buttons.dart
│   └── homepage.dart
│
├── firebase_options.dart
└── main.dart
```

---

# 🛠️ Built With

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Google Fonts
- Flutter SVG
- GetX

---

# 📦 Packages Used

| Package | Purpose |
|---------|---------|
| firebase_core | Firebase initialization |
| firebase_auth | User Authentication |
| cloud_firestore | Store user data |
| google_fonts | Custom Fonts |
| flutter_svg | SVG Icons |
| get | Navigation & Snackbars |

---

# 🚀 Getting Started

## 1. Clone Repository

```bash
git clone https://github.com/kutubofficial/email_auth_verification.git
```

---

## 2. Navigate to Project

```bash
cd login_signup
```

---

## 3. Install Dependencies

```bash
flutter pub get
```

---

## 4. Configure Firebase

Create a Firebase project and enable **Email/Password Authentication**.

Then configure Firebase in your Flutter project:

```bash
flutterfire configure
```

---

## 5. Run the Project

```bash
flutter run
```

---

# 🔥 Authentication Flow

```text
User Opens App
        │
        ▼
     Wrapper
        │
        ▼
Authenticated?
   │           │
 Yes          No
 │             │
 ▼             ▼
Home       Login Screen
               │
               ▼
      Sign Up / Login
               │
               ▼
      Email Verification
               │
               ▼
             Home
```

---

# 📁 Assets

```text
assets/
└── icons/
    ├── apple.svg
    └── google.svg
```

---

# 🎯 Upcoming Features

- Google Sign-In
- Apple Sign-In
- Phone Authentication
- Remember Me
- User Profile
- Dark Mode
- Form Validation
- Password Strength Checker
- Loading Animations
- Error Handling Improvements

---

# 🤝 Contributing

Contributions are welcome.

1. Fork this repository

2. Create a feature branch

```bash
git checkout -b feature-name
```

3. Commit your changes

```bash
git commit -m "Added new feature"
```

4. Push your branch

```bash
git push origin feature-name
```

5. Open a Pull Request

---

# 👨‍💻 Author

**Kutubuddin Ansari**

GitHub: https://github.com/your-github-kutubofficial

LinkedIn: https://linkedin.com/in/kutubofficial

---

# ⭐ Show Your Support

If you found this project useful, consider giving it a ⭐ on GitHub.

It helps others discover the project and motivates future improvements.

---

## 📄 License

This project is open-source and available under the **MIT License**.
