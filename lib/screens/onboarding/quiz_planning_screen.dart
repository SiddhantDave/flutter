import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class QuizPlanningScreen extends StatefulWidget {
  const QuizPlanningScreen({super.key});

  @override
  State<QuizPlanningScreen> createState() => _QuizPlanningScreenState();
}

class _QuizPlanningScreenState extends State<QuizPlanningScreen> {
  // Hardcoded for this specific screen based on the screenshot "10% completed"
  final double progress = 0.1;
  String? selectedOption;

  final List<Map<String, String>> options = [
    {'label': 'A', 'text': '1+ weeks'},
    {'label': 'B', 'text': '3-6 days'},
    {'label': 'C', 'text': '1-2 days'},
    {'label': 'D', 'text': 'Same day is fine'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(12),
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ),
        title: const Text(
          'Kin Introduction Quiz',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                Stack(
                  children: [
                    // Background track (Dark Green as seen in screenshot for the remaining part?)
                    // Actually in the screenshot the bar is two colors: Orange (left) and Dark Green (right).
                    // It looks like a full bar where the "empty" part is actually colored Dark Green.
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.primary, // Dark green for the "remaining" part
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // Progress part (Orange)
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8C00), // Orange color
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${(progress * 100).toInt()}% completed',
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // Question content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Reduced padding to fit wider cards if needed
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'How far in advance do you prefer to plan?',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...options.map((option) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = option['label'];
                        });
                      },
                      child: Container(
                        height: 64, // Slightly taller for better touch target
                        decoration: selectedOption == option['label']
                            ? BoxDecoration(
                                color: AppColors.white, // White background for selected
                                borderRadius: BorderRadius.circular(16),
                                border: const Border(
                                  top: BorderSide(color: AppColors.primary, width: 1.5),
                                  bottom: BorderSide(color: AppColors.primary, width: 4.0), // Thicker bottom border for 3D effect
                                  left: BorderSide(color: AppColors.primary, width: 2.0),
                                  right: BorderSide(color: AppColors.primary, width: 2.0),
                                ),
                              )
                            : BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.primary, // Dark green border for unselected too?
                                  // Screenshot shows unselected items have a thin border. 
                                  // Let's use primary color but thinner.
                                  width: 1.0,
                                ),
                              ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: selectedOption == option['label']
                                    ? AppColors.primary
                                    : const Color(0xFFD9D9D9), // Grey for unselected
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                option['label']!,
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: selectedOption == option['label']
                                      ? AppColors.white
                                      : const Color(0xFFFFFFFF), // White text on grey
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              option['text']!,
                              style: const TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black, // Black text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )).toList(),
                  const Spacer(),
                ],
              ),
            ),
          ),
          // Bottom buttons
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryLight, // Yellowish arrow
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next screen
                        // For now, I'll navigate to quiz-multiple-choice as a placeholder
                        Navigator.pushNamed(context, '/quiz-multiple-choice');
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
                        'Next Question',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
