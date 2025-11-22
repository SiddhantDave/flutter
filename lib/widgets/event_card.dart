import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'tag.dart';

class EventCard extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String time;
  final String venue;
  final List<String> tags;
  final int attendeesCount;
  final List<String> attendeeAvatars;
  final VoidCallback? onPress;

  const EventCard({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.time,
    required this.venue,
    required this.tags,
    required this.attendeesCount,
    this.attendeeAvatars = const [],
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Hero(
        tag: title,
        child: Container(
          width: double.infinity,
          height: 182,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.mutedForeground, width: 1),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Tags
              Positioned(
                top: 10,
                left: 10,
                child: Row(
                  children: tags.map((tag) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Material( // Material needed for Hero text/content to not look weird during flight if any
                      color: Colors.transparent,
                      child: EventCardTag(tag: tag),
                    ),
                  )).toList(),
                ),
              ),

              // Bottom Section
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(11),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w700, // Bold
                                fontSize: 15,
                                color: AppColors.white,
                                height: 1.2, // 18/15
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: Text(
                                  'Time- $time',
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400, // Regular
                                    fontSize: 8,
                                    color: AppColors.white,
                                    height: 1.25, // 10/8
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: Text(
                                  'Venue- $venue',
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400, // Regular
                                    fontSize: 8,
                                    color: AppColors.white,
                                    height: 1.25, // 10/8
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Right Section (Attendees)
                      Row(
                        children: [
                          // Avatars
                          SizedBox(
                            width: _calculateAvatarsWidth(),
                            height: 13,
                            child: Stack(
                              children: _buildAvatars(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              '$attendeesCount+ Attending',
                              style: const TextStyle(
                                color: AppColors.white,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400, // Regular
                                fontSize: 8,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateAvatarsWidth() {
    final count = attendeeAvatars.length > 3 ? 3 : attendeeAvatars.length;
    if (count == 0) return 0;
    // Width = 13 + (count - 1) * (13 - 6.5)
    // 13 + (count - 1) * 6.5
    return 13.0 + (count - 1) * 6.5;
  }

  List<Widget> _buildAvatars() {
    final avatars = attendeeAvatars.take(3).toList();
    // We want the first one (index 0) to be on top.
    // In Stack, last child is on top.
    // So we should add them in reverse order: 2, 1, 0.
    // But their positions are fixed: 0 is at 0, 1 is at 6.5, 2 is at 13.
    
    List<Widget> widgets = [];
    for (int i = avatars.length - 1; i >= 0; i--) {
      widgets.add(
        Positioned(
          left: i * 6.5,
          child: Container(
            width: 13,
            height: 13,
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
