import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import '../../utils/colors.dart';

class WelcomeScreen extends StatelessWidget {
  final XFile? imageFile;

  const WelcomeScreen({
    super.key,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              
              // Profile Picture with Badge
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Profile Picture
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD9D9D9),
                    ),
                    child: ClipOval(
                      child: imageFile != null
                          ? (kIsWeb
                              ? Image.network(
                                  imageFile!.path,
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(imageFile!.path),
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ))
                          : Image.asset(
                              'assets/temp/profile-image.png',
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  // Badge at bottom
                  Positioned(
                    bottom: -15,
                    child: Transform.rotate(
                      angle: -0.1, // Slight tilt to left
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Deep Thinker',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryLight,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.info_outline, // Matches Figma screenshot better than fire emoji
                              color: AppColors.primaryLight,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Welcome Text
              const Text(
                "Welcome Jhanvi, you're a rockstar",
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Subtext
              const Text(
                "We'll use this energy to guide you toward the right Kin Circle and experiences.",
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to next screen (probably home)
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.primaryLight,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
              ),
              
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
