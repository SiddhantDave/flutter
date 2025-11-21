import 'package:flutter/material.dart';
import '../utils/colors.dart';

class QuizAgeRangeScreen extends StatefulWidget {
  const QuizAgeRangeScreen({super.key});

  @override
  State<QuizAgeRangeScreen> createState() => _QuizAgeRangeScreenState();
}

class _QuizAgeRangeScreenState extends State<QuizAgeRangeScreen> {
  int currentQuestion = 1;
  int totalQuestions = 10;
  
  late FixedExtentScrollController _scrollController;
  int selectedIndex = 3; // Default to 35-40

  double get progress => currentQuestion / totalQuestions;

  final List<String> ageRanges = [
    '13-18',
    '18-24',
    '25-34',
    '35-40',
    '41-46',
    '47-52',
    '53-60',
    '61-70',
    '71-80',
    '81-90',
    '91-100',
    '100+',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: selectedIndex);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double getScale(int index, int centerIndex) {
    final distance = (index - centerIndex).abs();
    if (distance == 0) return 1.0;
    if (distance == 1) return 0.7;
    if (distance == 2) return 0.5;
    return 0.35;
  }

  Color getColor(int index, int centerIndex) {
    final distance = (index - centerIndex).abs();
    if (distance == 0) return const Color(0xFFE67E22);
    if (distance == 1) return const Color(0xFF4A4A4A);
    return const Color(0xFFD9D9D9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
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
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.mutedForeground.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFF8C00),
                              Color(0xFF8B4513),
                              Color(0xFF1E3000),
                            ],
                            stops: [0.0, 0.5, 1.0],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
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
          const SizedBox(height: 20),
          // Question text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'I fall under the age range of',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
                height: 1.19,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          // Top emoji
          const Text(
            '👦🏻',
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 20),
          // Wheel picker
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: _scrollController,
              itemExtent: 60,
              diameterRatio: 3.5, // Increased from 2.5 to make it even flatter
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: ageRanges.length,
                builder: (context, index) {
                  final scale = getScale(index, selectedIndex);
                  final color = getColor(index, selectedIndex);
                  
                  return Center(
                    child: Transform.scale(
                      scale: scale,
                      child: Text(
                        ageRanges[index],
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 42,
                          fontWeight: FontWeight.w500, // Changed from w600 to w500
                          color: color,
                          letterSpacing: -0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Bottom emoji
          const SizedBox(height: 20),
          const Text(
            '👴🏻',
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 16),
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
                      borderRadius: BorderRadius.circular(11.24),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryLight,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/quiz-activities');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primaryLight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.24),
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
