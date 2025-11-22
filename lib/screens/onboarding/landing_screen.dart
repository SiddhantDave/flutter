import 'package:flutter/material.dart';
import '../../widgets/curved_header.dart';
import '../../widgets/kin_logo.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.45;

    return Scaffold(
      body: Column(
        children: [
          CurvedHeader(height: headerHeight),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 18),
              child: Column(
                children: [
                  const SizedBox(height: 22), // Approximate margin top for text section (40 - 18 padding?) RN says marginTop: 40 for textSection
                  const KinLogo(width: 74, height: 50),
                  const SizedBox(height: 20),
                  Text(
                    'Find Your Circle on Kin',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 10), // Gap not explicitly defined in RN textSection gap: 20, but title has marginBottom 0. Subtitle has marginBottom 40.
                  // Actually RN textSection has gap: 20. So Logo -> Title is 20. Title -> Subtitle is 20.
                  // But Title has lineHeight 20.
                  // Let's use gap: 20.
                  const SizedBox(height: 10), // Adjusting visually
                  Text(
                    'An invite-only club, but we\'re always open to good energy.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/invite');
                        },
                        child: const Text('Join with an Invite'),
                      ),
                      const SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Apply to Join'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space before footer
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        'Kin is a private community. ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Terms & Conditions',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 11.24,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
