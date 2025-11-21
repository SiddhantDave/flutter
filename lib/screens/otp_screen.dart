import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../utils/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 20,
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
        fontFamily: 'SF Pro Display',
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.primary, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Title
              const Text(
                'Verify account with OTP',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              const Text(
                'OTP have been sent 4 digit code to +91811*****',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 12,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 25),
              // OTP Input
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration?.copyWith(
                      border: Border.all(color: AppColors.primary, width: 1),
                    ),
                  ),
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              const SizedBox(height: 16),
              // Resend Code
              const Text(
                'Resend Code',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 12,
                  color: AppColors.mutedForeground,
                  decoration: TextDecoration.underline,
                ),
              ),
              const Spacer(),
              // Footer
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/get-to-know-you');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primaryLight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.24),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Text(
                        'Kin is a private community. ',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 12,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontSize: 12,
                            color: AppColors.mutedForeground,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
