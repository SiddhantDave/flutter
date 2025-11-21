import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/kin_logo.dart';

class GetToKnowYouScreen extends StatelessWidget {
  const GetToKnowYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              // Logo
              const KinLogo(width: 74, height: 50),
              const SizedBox(height: 40),
              // Title
              const Text(
                'Let\'s Get to Know You',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Description
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Yes, you gotta fill this (takes ~3 mins). It\'s how we make sure you aren\'t stuck at a pottery workshop when you\'re really a rooftop party person.',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2D2D2D),
                    height: 1.4,
                    letterSpacing: -0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              // Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to quiz
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.primaryLight,
                    elevation: 2,
                    shadowColor: Colors.black.withOpacity(0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Start the Quiz - 15min',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Footer text
              const Text(
                'The more you, the better. Answer honestly —\nthis isn\'t a test, it\'s a mirror.',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF666666),
                  height: 1.3,
                  letterSpacing: -0.15,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
