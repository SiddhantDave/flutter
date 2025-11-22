import 'package:flutter/material.dart';
import '../utils/colors.dart';

class EventCardTag extends StatelessWidget {
  final String tag;

  const EventCardTag({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          fontSize: 8,
          color: AppColors.foreground,
        ),
      ),
    );
  }
}
