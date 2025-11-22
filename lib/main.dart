import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'screens/dev_router_screen.dart';
import 'screens/home_screen.dart';
import 'screens/onboarding/landing_screen.dart';
import 'screens/onboarding/invite_screen.dart';
import 'screens/onboarding/login_screen.dart';
import 'screens/onboarding/otp_screen.dart';
import 'screens/onboarding/get_to_know_you_screen.dart';
import 'screens/onboarding/quiz_screen.dart';
import 'screens/onboarding/quiz_multiple_choice_screen.dart';
import 'screens/onboarding/quiz_age_range_screen.dart';
import 'screens/onboarding/quiz_activities_screen.dart';
import 'screens/onboarding/quiz_conversation_screen.dart';
import 'screens/event_details/event_details_page.dart';
import 'screens/event_listing_page.dart';

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
        '/': (context) => const DevRouterScreen(),
        '/home': (context) => const HomeScreen(),
        '/landing': (context) => const LandingScreen(),
        '/invite': (context) => const InviteScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/get-to-know-you': (context) => const GetToKnowYouScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/quiz-multiple-choice': (context) => const QuizMultipleChoiceScreen(),
        '/quiz-age-range': (context) => const QuizAgeRangeScreen(),
        '/quiz-activities': (context) => const QuizActivitiesScreen(),
        '/quiz-conversation': (context) => const QuizConversationScreen(),
        '/event-details': (context) => const EventDetailsPage(),
        '/event-listing': (context) => const EventListingPage(),
      },
    );
  }
}
