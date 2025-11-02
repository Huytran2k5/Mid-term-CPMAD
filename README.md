# 🧋 Milk Tea Order App

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/Huytran2k5/Mid-term-CPMAD)
[![Platform](https://img.shields.io/badge/platform-Flutter-blue)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/backend-Firebase-orange)](https://firebase.google.com)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

A modern Flutter application for ordering and customizing milk tea beverages. Users can register accounts, sign in, select their favorite milk tea types and toppings, and manage their personal preferences with real-time data synchronization powered by Firebase.

## ✨ Features

- 🔐 **User Authentication** - Secure email/password registration and login
- 🧋 **Milk Tea Customization** - Choose from 10 different milk tea types
- 🍮 **Topping Selection** - Select multiple toppings (Black Pearl, Jelly, Pudding, etc.)
- 👤 **User Profile Management** - Update personal preferences and settings
- 📱 **Real-time Sync** - All data synchronized with Firebase Firestore
- 📋 **User List View** - Browse other users' preferences
- 🎨 **Modern UI** - Clean and intuitive Material Design interface

## 📸 Screenshots

<table>
  <tr>
    <td><img src="screenshots/signin_screen.png" alt="Sign In" width="200"/></td>
    <td><img src="screenshots/register_screen.png" alt="Register" width="200"/></td>
    <td><img src="screenshots/main_screen.png" alt="Main Screen" width="200"/></td>
    <td><img src="screenshots/settings_screen.png" alt="Settings" width="200"/></td>
  </tr>
  <tr>
    <td align="center"><b>Sign In</b></td>
    <td align="center"><b>Register</b></td>
    <td align="center"><b>Home</b></td>
    <td align="center"><b>Settings</b></td>
  </tr>
</table>

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.35.7 or higher) - [Installation Guide](https://docs.flutter.dev/get-started/install)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control
- **Firebase Account** for backend services

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/Huytran2k5/Mid-term-CPMAD.git
   cd Mid-term-CPMAD
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase** (See detailed setup below)

4. **Run the app**
   ```bash
   flutter run
   ```

## 🔥 Firebase Configuration

### Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project named `app-demo-f2315` (or your preferred name)
3. Enable Google Analytics (optional)

### Step 2: Register Your App

**For Android:**
1. Click **Add app** → Select **Android**
2. Package name: `com.example.gkdnt` (from `android/app/build.gradle.kts`)
3. Download `google-services.json`
4. Place it in `android/app/` directory

**For iOS:**
1. Click **Add app** → Select **iOS**
2. Bundle ID: `com.example.gkdnt` (from Xcode project)
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

### Step 3: Enable Authentication

1. In Firebase Console, go to **Authentication**
2. Click **Get Started**
3. Select **Email/Password** under **Sign-in method**
4. Enable **Email/Password** authentication
5. Click **Save**

### Step 4: Setup Firestore Database

1. Go to **Firestore Database** in Firebase Console
2. Click **Create database**
3. Select **Production mode** (recommended)
4. Choose your preferred location
5. Click **Enable**

### Step 5: Configure Security Rules

⚠️ **IMPORTANT**: Update Firestore Security Rules to allow authenticated users to read/write data.

1. In Firestore Database, go to **Rules** tab
2. Replace the default rules with:

```javascript
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    // Allow authenticated users to read and write their own document
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Allow authenticated users to read all user documents
    match /users/{document=**} {
      allow read: if request.auth != null;
    }
  }
}
```

3. Click **Publish**

### Step 6: Update Firebase Options in Code

The Firebase configuration is already set in `lib/main.dart`:

```dart
await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: 'AIzaSyCMakiwzbjdKcsuDbFwouy2ub8gkIgDCzI',
    appId: '1:1035535024728:android:d4b1dd6851f95a4c9e802d',
    messagingSenderId: '1035535024728',
    projectId: 'app-demo-f2315',
    storageBucket: 'app-demo-f2315.firebasestorage.app',
  ),
);
```

If you created a different Firebase project, update these values with your own from `google-services.json`.

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  firebase_core: ^3.8.1
  firebase_auth: ^5.3.0
  cloud_firestore: ^5.4.0
  provider: ^6.0.5
  flutter_spinkit: ^5.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── user.dart            # User model classes
│   └── user_model.dart      # User data model
├── screens/
│   ├── wrapper.dart         # Authentication wrapper
│   ├── authenticate/
│   │   ├── authenticate.dart
│   │   ├── sign_in.dart
│   │   └── register.dart
│   └── home/
│       ├── home.dart
│       ├── settings_form.dart
│       └── user_list.dart
├── services/
│   ├── auth.dart            # Authentication service
│   └── database.dart        # Firestore database service
└── shared/
    ├── constants.dart       # App constants
    └── loading.dart         # Loading widget
```

## 💻 Usage Guide

### First Time Users

1. **Register an Account**
   - Launch the app
   - Click on **Register** button
   - Enter your email and password (min 6 characters)
   - Click **Register** to create your account
   - A new user document will be created in Firestore automatically

2. **Sign In**
   - Enter your registered email and password
   - Click **Sign In**
   - You'll be redirected to the home screen

3. **Customize Your Preferences**
   - Tap the **Settings** button (gear icon) in the app bar
   - Update your name
   - Select your favorite milk tea type from the dropdown:
     - Classic Milk Tea
     - Matcha Milk Tea
     - Chocolate Milk Tea
     - Thai Green Milk Tea
     - Taro Milk Tea
     - Black Tea Milk Tea
     - Oolong Milk Tea
     - Strawberry Milk Tea
     - Mint Milk Tea
     - Cheese Milk Tea
   - Choose your preferred toppings:
     - Black Pearl
     - Jelly
     - Pudding
     - Cheese Cream
     - White Pearl
     - Coconut Jelly
   - Click **Update** to save changes

4. **View User Community**
   - The home screen displays all registered users
   - See what milk tea types and toppings others prefer
   - Get inspired by the community's choices!

## 🔧 Troubleshooting

### Common Issues and Solutions

#### ❌ Firebase Error: `PERMISSION_DENIED`

**Problem:** Settings form shows loading forever or error message

**Solution:**
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Navigate to **Firestore Database** → **Rules**
4. Update rules as shown in the Firebase Configuration section
5. Click **Publish**
6. Restart the app

#### ❌ Error: `No Firebase App '[DEFAULT]' has been created`

**Problem:** App crashes on startup

**Solution:**
1. Make sure `google-services.json` is in `android/app/` directory
2. Check that Firebase is initialized in `main.dart`
3. Run `flutter clean` and `flutter pub get`
4. Rebuild the app

#### ❌ Authentication Error: `Invalid email`

**Problem:** Cannot register with email

**Solution:**
- Ensure email format is valid (e.g., `user@example.com`)
- Check that Email/Password authentication is enabled in Firebase Console
- Password must be at least 6 characters

#### ❌ App crashes when opening Settings Form

**Problem:** App stops responding or crashes

**Solution:**
- This was fixed by implementing `TextEditingController` for form fields
- Make sure you have the latest code from the repository
- Run `flutter clean` and rebuild

#### ❌ Build Error: `Gradle build failed`

**Problem:** Android build fails

**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

#### ❌ Dependencies version conflict

**Problem:** Package version errors

**Solution:**
```bash
flutter pub upgrade
flutter pub get
```

## 🧪 Testing

### Manual Testing Checklist

- [ ] User registration with valid email/password
- [ ] User sign-in with registered credentials
- [ ] Sign out functionality
- [ ] Update user name in settings
- [ ] Change milk tea type preference
- [ ] Select/deselect multiple toppings
- [ ] Save settings and verify changes persist
- [ ] View user list on home screen
- [ ] Test with invalid inputs (empty fields, short passwords)

### Running Tests

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### Contribution Guidelines

- Follow Flutter/Dart style guide
- Write meaningful commit messages
- Test your changes thoroughly
- Update documentation if needed
- Respect the existing code structure

## 📝 Changelog

### Version 1.0.0 (Current)

#### Features
- ✅ Email/Password authentication
- ✅ User registration and login
- ✅ Milk tea type selection (10 types)
- ✅ Multiple topping selection (6 options)
- ✅ User profile management
- ✅ Real-time data synchronization
- ✅ User list view

#### Bug Fixes
- 🐛 Fixed Firebase initialization for newer Flutter versions
- 🐛 Fixed TextFormField crash with StreamBuilder
- 🐛 Fixed Firestore permission issues
- 🐛 Fixed settings form initialization
- 🐛 Improved error handling and loading states

#### Technical Improvements
- 🔧 Updated to Flutter 3.35.7
- 🔧 Migrated to latest Firebase plugins
- 🔧 Implemented TextEditingController for stable form handling
- 🔧 Added proper null safety checks
- 🔧 Enhanced UI/UX with better loading indicators

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Huytran2k5** - [GitHub Profile](https://github.com/Huytran2k5)

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- Firebase for backend infrastructure
- Contributors and testers
- Milk tea enthusiasts community 🧋

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Review existing [Issues](https://github.com/Huytran2k5/Mid-term-CPMAD/issues)
3. Create a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots if applicable
   - Flutter version (`flutter --version`)

## 🔗 Related Documentation

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Firestore Security Rules](https://firebase.google.com/docs/firestore/security/get-started)
- [Provider Package](https://pub.dev/packages/provider)

---

Made with ❤️ and 🧋 by Huytran2k5

See details in `pubspec.yaml`.

## Support
- Email: 523H0033@student.tdtu.edu.vn
- Email: 523H0002@student.tdtu.edu.vn

## Credits
- Development team:
		Tran Duc Huy
		Nguyen Duc Anh

## References & Related URLs
- [Flutter](https://flutter.dev)
- [Firebase](https://firebase.google.com)
- [Provider](https://pub.dev/packages/provider)

## License
MIT License. See LICENSE file for details.

## Changelog
- v1.0.0: Project initialized, basic features.
- v1.1.0: Added topping feature, new UI.

## Known Issues
- Dark mode not supported yet.
- No real ordering feature yet.

# gkdnt

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.