import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ApplicationSubmittedScreen extends StatelessWidget {
  const ApplicationSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Top Bar (Time, Signal, Battery - usually handled by system status bar, 
                  // but if we need a custom one we can add it. 
                  // For now, we'll assume standard system status bar is fine or transparent)
                  
                  const Spacer(flex: 2),
                  
                  // Heading
                  const Text(
                    'Thank You for Applying',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 24,
                      fontWeight: FontWeight.w600, // Semibold/Medium
                      color: AppColors.black,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Subtext
                  const Text(
                    'We’re curating a community with intention—thanks for your patience while we review yours.',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15,
                      fontWeight: FontWeight.w400, // Regular
                      color: Color(0xFF333333), // Dark grey/black
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Follow us on Instagram Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement Instagram link
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primaryLight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Follow us on Instagram',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Contact support Text Button
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement Contact Support
                    },
                    child: const Text(
                      'Contact support',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  
                  const Spacer(flex: 3),
                  
                  // Bottom Indicator (Home indicator) - usually system handled
                  Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: const EdgeInsets.only(bottom: 8),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}


