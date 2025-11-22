import 'package:flutter/material.dart';
import '../utils/colors.dart';

/// A reusable widget that displays a row of overlapping attendee avatars
/// and the total number of attendees.
///
/// This widget is used in both the `EventCard` (small size) and the
/// `EventDetailsPage` (larger size). It supports two size variants via the
/// `avatarSize` parameter.
class AttendeeAvatars extends StatelessWidget {
  /// List of avatar image asset paths.
  final List<String> avatarImages;

  /// Total number of attendees (displayed as "X+ Attending").
  final int attendeesCount;

  /// Size of each avatar circle. Defaults to 13.0 (used in `EventCard`).
  final double avatarSize;

  /// Overlap offset between avatars. Defaults to 6.5 (half of avatarSize).
  final double overlapOffset;

  /// Text style for the attendees count label.
  final TextStyle? countTextStyle;

  const AttendeeAvatars({
    super.key,
    required this.avatarImages,
    required this.attendeesCount,
    this.avatarSize = 13.0,
    double? overlapOffset,
    this.countTextStyle,
  }) : overlapOffset = overlapOffset ?? avatarSize / 2;

  @override
  Widget build(BuildContext context) {
    // Show at most 3 avatars, as per original implementation.
    final displayedAvatars = avatarImages.take(3).toList();
    final avatarCount = displayedAvatars.length;

    // Width needed for the overlapping stack.
    final stackWidth = avatarCount > 0 ? avatarSize + (avatarCount - 1) * overlapOffset : 0.0;

    return Row(
      children: [
        if (avatarCount > 0)
          SizedBox(
            width: stackWidth,
            height: avatarSize,
            child: Stack(
              children: _buildAvatarStack(displayedAvatars),
            ),
          ),
        const SizedBox(width: 4),
        Text(
          '${attendeesCount}+ Attending',
          style: countTextStyle ??
              const TextStyle(
                color: AppColors.white,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: 8,
                letterSpacing: 0.16,
              ),
        ),
      ],
    );
  }

  List<Widget> _buildAvatarStack(List<String> avatars) {
    // Render in reverse order so the first avatar is on top (as original).
    List<Widget> widgets = [];
    for (int i = avatars.length - 1; i >= 0; i--) {
      widgets.add(
        Positioned(
          left: i * overlapOffset,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
              image: DecorationImage(
                image: AssetImage(avatars[i]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}
