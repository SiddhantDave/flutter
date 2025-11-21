import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'screens/landing_screen.dart';
import 'screens/invite_screen.dart';
import 'screens/login_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/get_to_know_you_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kin',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/invite': (context) => const InviteScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/get-to-know-you': (context) => const GetToKnowYouScreen(),
      },
    );
  }
}
