# Nyaya Connect - Digital Legal Aid Platform

A comprehensive Flutter application that connects citizens, small private law firms, legal aid NGOs, and paralegal volunteers. The platform streamlines case management, client communication, calendar scheduling, and documentation while providing legal literacy and awareness resources.

## Features

### Authentication & User Management
- **Splash Screen**: Animated app introduction with logo
- **Welcome Screen**: User type selection (Client/Advocate)
- **Login/SignUp**: Secure authentication with form validation
- **Verification**: Two-factor verification via phone and email

### Client Features
- **Home Dashboard**: Personalized welcome with search functionality
- **Legal Categories**: Quick access to Civil, Criminal, Tax, and Revenue law
- **E-Court Integration**: Digital communication platform
- **Personal Section**: Document and case management
- **AI Doubt Forum**: Legal query assistance (placeholder)
- **Reviews & Testimonials**: User feedback display

### Advocate Features
- **Professional Dashboard**: Streamlined advocate interface
- **Task Management**: Calendar, Tasks, and Invoice tracking
- **Case Management**: Document and case organization
- **Client Communication**: Integrated messaging system

### Legal Literacy (Public-Facing)
- **Fundamental Rights**: Information on legal rights
- **Educational Resources**: Guides on various legal topics
- **Legal Aid Guide**: Step-by-step process to avail legal aid
- **Contact Information**: Quick access to legal services helplines

## Project Structure

```
nyaya_connect/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── screens/
│   │   ├── splash.dart           # Splash screen
│   │   ├── welcome.dart          # Welcome screen
│   │   ├── login.dart            # Login screen
│   │   ├── signup.dart           # Sign up screen
│   │   ├── verify.dart           # Verification screen
│   │   ├── home_client.dart      # Client home screen
│   │   ├── home_advocate.dart    # Advocate home screen
│   │   └── legal_literacy.dart   # Legal literacy screen
│   └── widgets/
│       ├── bottom_nav_bar.dart   # Custom bottom navigation
│       ├── category_card.dart    # Reusable category card
│       └── testimonial_card.dart # Reusable testimonial card
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android Studio or VS Code with Flutter extensions
- Android SDK for Android development
- Xcode for iOS development (macOS only)

### Installation

1. **Clone or download the project**
   ```bash
   cd C:\Users\ARSENAL\CascadeProjects\nyaya_connect
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## Design Guidelines

The app follows Material Design 3 principles with:
- **Color Scheme**: Blue gradient theme (#1E88E5 to #42A5F5)
- **Typography**: Roboto font family
- **Spacing**: Consistent padding and margins
- **Components**: Rounded corners, elevated cards, gradient buttons
- **Responsive**: Optimized for mobile screens

## Navigation Flow

```
Splash Screen
    ↓
Welcome Screen
    ↓
Login/SignUp → Verification
    ↓
Home (Client/Advocate)
    ↓
├── Messages
├── Profile
└── Settings (Legal Literacy)
```

## Key Components

### Screens
- **SplashScreen**: Auto-transitions after 3 seconds with fade animation
- **WelcomeScreen**: User type selection with gradient buttons
- **LoginScreen**: Form validation with remember me option
- **SignUpScreen**: User type toggle with terms acceptance
- **VerifyScreen**: Dual OTP verification (phone + email)
- **HomeClientScreen**: Client dashboard with categories and resources
- **HomeAdvocateScreen**: Advocate dashboard with professional tools
- **LegalLiteracyScreen**: Educational content and legal aid information

### Widgets
- **CustomBottomNavBar**: Gradient-based navigation with 4 tabs
- **CategoryCard**: Reusable card for legal categories
- **TestimonialCard**: User review display component

## Dummy Data

The app currently uses static/dummy data for:
- Legal categories
- Testimonials and reviews
- Educational resources
- Legal rights information

## Future Enhancements

- Backend integration for user authentication
- Real-time messaging system
- Document upload and management
- Calendar and appointment scheduling
- Payment gateway for legal services
- AI chatbot integration
- Push notifications
- Multi-language support

## Technical Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **UI**: Material Design 3
- **State Management**: StatefulWidget (can be upgraded to Provider/Riverpod)
- **Navigation**: Navigator 2.0

## Testing

Run tests using:
```bash
flutter test
```

## Contributing

This is a production-ready template. To contribute:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is created for educational and demonstration purposes.

## Support

For issues or questions, please contact the development team.

---

**Nyaya Connect** - Justice Digitally Connected
