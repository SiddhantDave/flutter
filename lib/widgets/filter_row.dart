import 'package:flutter/material.dart';
import '../utils/colors.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          FilterButton(
            label: "Filters",
            icon: const FilterIcon(),
            onPress: () {},
          ),
          const SizedBox(width: 8),
          FilterButton(
            label: "Price: High to Low",
            onPress: () {},
          ),
          const SizedBox(width: 8),
          FilterButton(
            label: "Show Nearby",
            onPress: () {},
          ),
          const SizedBox(width: 8),
          FilterButton(
            label: "Weekend",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onPress;

  const FilterButton({
    super.key,
    required this.label,
    this.icon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF70A31B).withOpacity(0.13),
          borderRadius: BorderRadius.circular(20), // More rounded
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500, // Slightly bolder
                fontSize: 12,
                color: AppColors.primary,
                height: 1.1,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 6),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 14,
      height: 14,
      child: CustomPaint(
        painter: _FilterIconPainter(),
      ),
    );
  }
}

class _FilterIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final dotPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    // Draw 3 vertical lines
    // Line 1
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.1),
      Offset(size.width * 0.2, size.height * 0.9),
      paint,
    );
    // Dot 1 (Top)
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.3), 2, dotPaint);

    // Line 2
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.1),
      Offset(size.width * 0.5, size.height * 0.9),
      paint,
    );
    // Dot 2 (Bottom)
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.7), 2, dotPaint);

    // Line 3
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.1),
      Offset(size.width * 0.8, size.height * 0.9),
      paint,
    );
    // Dot 3 (Middle)
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.5), 2, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
