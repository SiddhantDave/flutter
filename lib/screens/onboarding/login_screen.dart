import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/curved_header.dart';
import '../../widgets/kin_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const KinLogo(width: 65.92, height: 39.64),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 260,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.24),
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 1.124,
                                  ),
                                  color: AppColors.background,
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    const Icon(
                                      Icons.mail_outline,
                                      color: AppColors.primary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 11.24),
                                    Expanded(
                                      child: TextFormField(
                                        style: const TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 16,
                                          color: AppColors.primary,
                                          letterSpacing: -0.24,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                            color: AppColors.primary,
                                          ),
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
                                    const SizedBox(width: 16),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 0.94,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 14.06),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 14.06,
                                        color: AppColors.primary,
                                        height: 1.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 0.94,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.24),
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 1.124,
                                  ),
                                  color: AppColors.background,
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    const Icon(
                                      Icons.phone_outlined,
                                      color: AppColors.primary,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 11.24),
                                    Expanded(
                                      child: TextFormField(
                                        style: const TextStyle(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 16,
                                          color: AppColors.primary,
                                          letterSpacing: -0.24,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: 'Phone No.',
                                          hintStyle: TextStyle(
                                            color: AppColors.primary,
                                          ),
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
                                    const SizedBox(width: 16),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                height: 50.5,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/otp');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.primaryLight,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11.24),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 70.82),
                                  ),
                                  child: const Text(
                                    'Connect Account',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.24,
                                      height: 16.86 / 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 0.94,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 14.06),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 14.06,
                                        color: AppColors.primary,
                                        height: 1.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 0.94,
                                      color: AppColors.mutedForeground,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 21.51),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google-icon.png',
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(width: 24),
                            Image.asset(
                              'assets/images/apple-icon.png',
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
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
