import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils/colors.dart';

class EventCardTag extends StatelessWidget {
  final String tag;

  const EventCardTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(27),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 11),
          color: Colors.white.withOpacity(0.54),
          child: Text(
            tag,
            style: const TextStyle(
              color: AppColors.foreground,
              fontFamily: 'SF Pro Display',
              fontSize: 10,
              height: 1.2, // 12/10
              letterSpacing: 0.23,
              fontWeight: FontWeight.w400, // Regular
            ),
          ),
        ),
      ),
    );
  }
}
