import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/curved_header.dart';
import '../widgets/kin_logo.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.45;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CurvedHeader(
                height: headerHeight,
                imagePath: 'assets/images/invite-code-header.png',
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const KinLogo(width: 80, height: 40),
                      const SizedBox(height: 10),
                      const Text(
                        'Enter Invite Code',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          letterSpacing: -0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.primary,
                              width: 1.8,
                            ),
                            color: AppColors.background,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 22),
                              const Icon(
                                Icons.mail_outline,
                                color: AppColors.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: TextFormField(
                                  initialValue: 'BX-10P24-R4',
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 18,
                                    color: AppColors.primary,
                                    letterSpacing: -0.2,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 22),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.primaryLight,
                            elevation: 5,
                            shadowColor: Colors.black.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            'Join with an Invite',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              color: Color(0xFF2D2D2D),
                              height: 20 / 14,
                            ),
                            children: [
                              TextSpan(text: 'Kin is a private community. '),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Back Button
          Positioned(
            top: 55,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_left,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
