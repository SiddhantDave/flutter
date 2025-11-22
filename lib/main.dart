import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
import 'screens/onboarding/quiz_planning_screen.dart';
import 'screens/onboarding/quiz_open_ended_screen.dart';
import 'screens/event_details/event_details_page.dart';
import 'screens/event_listing_page.dart';
import 'screens/my_bookings_page.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/profile/profile_details_screen.dart';
import 'screens/ticket_screen.dart';
import 'screens/peoples_page.dart';
import 'screens/person_page.dart';
import 'screens/onboarding/application_submitted_screen.dart';
import 'screens/onboarding/profile_picture_upload_screen.dart';
import 'screens/onboarding/welcome_screen.dart';

import 'utils/events_data.dart';

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
      onGenerateRoute: (settings) {
        // Handle routes that need arguments
        if (settings.name == '/event-details') {
          final args = settings.arguments as EventData?;
          return MaterialPageRoute(
            builder: (context) => EventDetailsPage(
              event: args ?? sampleEvents.first, // Default to first event if no args
            ),
          );
        }
        
        // Handle regular routes
        final routes = <String, WidgetBuilder>{
          '/': (context) => const DevRouterScreen(),
          '/home': (context) => const HomeScreen(),
          '/landing': (context) => const LandingScreen(),
          '/invite': (context) => const InviteScreen(),
          '/login': (context) => const LoginScreen(),
          '/otp': (context) => const OtpScreen(),
          '/get-to-know-you': (context) => const GetToKnowYouScreen(),
          '/quiz': (context) => const QuizScreen(),
          '/quiz-planning': (context) => const QuizPlanningScreen(),
          '/quiz-multiple-choice': (context) => const QuizMultipleChoiceScreen(),
          '/quiz-age-range': (context) => const QuizAgeRangeScreen(),
          '/quiz-activities': (context) => const QuizActivitiesScreen(),
          '/quiz-open-ended': (context) => const QuizOpenEndedScreen(),
          '/quiz-conversation': (context) => const QuizConversationScreen(),
          '/event-listing': (context) => const EventListingPage(),
          '/profile': (context) => const ProfileScreen(),
          '/profile-details': (context) => const ProfileDetailsScreen(),
          '/my-bookings': (context) => const MyBookingsPage(),
          '/ticket': (context) => const TicketScreen(),
          '/peoples': (context) => const PeoplesPage(),
          '/person': (context) {
            final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
            return PersonPage(personData: args);
          },
          '/application-submitted': (context) => const ApplicationSubmittedScreen(),
          '/profile-picture-upload': (context) => const ProfilePictureUploadScreen(),
        };

        if (settings.name == '/welcome') {
          final args = settings.arguments as XFile?;
          return MaterialPageRoute(
            builder: (context) => WelcomeScreen(imageFile: args),
          );
        }

        final builder = routes[settings.name];
        if (builder != null) {
          return MaterialPageRoute(builder: builder);
        }

        return null;
      },
    );
  }
}
