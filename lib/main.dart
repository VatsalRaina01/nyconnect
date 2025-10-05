import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';   // ✅ for state management

// Providers
import 'providers/theme_provider.dart';   // ✅ custom theme provider

// Theme
import 'theme/app_theme.dart';

// Core Screens
import 'screens/splash.dart';
import 'screens/welcome.dart';
import 'screens/onboarding.dart'; // ✅ wrapper for onboarding pages

// Auth Screens
import 'screens/auth/login.dart';
import 'screens/auth/signup.dart';
import 'screens/auth/verify.dart';

// Dashboards
import 'screens/client/home_client.dart';
import 'screens/advocate/home_advocate.dart';

// Features
import 'screens/features/lawyer_screen.dart';
import 'screens/features/chat_screen.dart';
import 'screens/features/meeting_screen.dart';
import 'screens/features/documents_screen.dart';
import 'screens/features/invoices_screen.dart'; // ✅ corrected name
import 'screens/features/tasks_screen.dart';
import 'screens/features/calender_screen.dart'; // ✅ corrected spelling

// Cases
import 'screens/cases_screen.dart';
import 'screens/case_detail_screen.dart';

// Profile
import 'screens/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const NyayaConnectApp(),
    ),
  );
}

class NyayaConnectApp extends StatelessWidget {
  const NyayaConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'NyayaConnect',
      debugShowCheckedModeBanner: false,

      // ✅ Light + Dark Theme Support
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode, // ✅ dynamic via provider

      // ✅ Start from Splash
      initialRoute: '/splash',

      // ✅ Routes
      routes: {
        // Core flow
        '/splash': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/welcome': (context) => const WelcomeScreen(),

        // Auth
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/verify': (context) => VerifyScreen(),

        // Dashboards
        '/homeClient': (context) => HomeClientScreen(userName: "Client"),
        '/homeAdvocate': (context) => HomeAdvocateScreen(userName: "Advocate"),

        // Profile
        '/profile': (context) => const ProfileScreen(),

        // Cases
        '/cases': (context) => CasesScreen(role: "Client"),
        '/casesAdvocate': (context) => CasesScreen(role: "Advocate"),
        '/caseDetail': (context) =>
            CaseDetailScreen(caseTitle: "Demo Case"), // ✅ placeholder

        // Features
        '/lawyers': (context) => const LawyerScreen(),
        '/chat': (context) => const ChatScreen(),
        '/meeting': (context) => const MeetingScreen(),
        '/documents': (context) => const DocumentsScreen(),
        '/invoices': (context) => const InvoicesScreen(),
        '/tasks': (context) => const TasksScreen(),
        '/calendar': (context) => const CalendarScreen(),
      },
    );
  }
}
