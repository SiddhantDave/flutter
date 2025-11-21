import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'screens/landing_screen.dart';
import 'screens/invite_screen.dart';
import 'screens/login_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/get_to_know_you_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/quiz_multiple_choice_screen.dart';
import 'screens/quiz_age_range_screen.dart';
import 'screens/quiz_activities_screen.dart';
import 'screens/quiz_conversation_screen.dart';

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
        '/quiz': (context) => const QuizScreen(),
        '/quiz-multiple-choice': (context) => const QuizMultipleChoiceScreen(),
        '/quiz-age-range': (context) => const QuizAgeRangeScreen(),
        '/quiz-activities': (context) => const QuizActivitiesScreen(),
        '/quiz-conversation': (context) => const QuizConversationScreen(),
      },
    );
  }
}
