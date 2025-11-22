import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/events_data.dart';
import '../../widgets/bottom_nav_bar.dart';

class EventDetailsPage extends StatelessWidget {
  final EventData event;

  const EventDetailsPage({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60), // Space for header
                  // Event Image
                  Stack(
                    children: [
                      Hero(
                        tag: event.title, // Using title as tag for uniqueness in this context
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            event.backgroundImage,
                            width: double.infinity,
                            height: 182,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (event.tags.isNotEmpty)
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              event.tags.first,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Price Tag
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D2D2D),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      '₹2000/-',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Title
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'SF Pro Display',
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Attendees
                  Row(
                    children: [
                      SizedBox(
                        width: 52,
                        height: 20,
                        child: Stack(
                          children: [
                            if (event.attendeeAvatars.isNotEmpty) _buildAvatar(event.attendeeAvatars[0], 0),
                            if (event.attendeeAvatars.length > 1) _buildAvatar(event.attendeeAvatars[1], 14),
                            if (event.attendeeAvatars.length > 2) _buildAvatar(event.attendeeAvatars[2], 28),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${event.attendeesCount}+ Attending',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Date
                  _buildInfoRow(
                    icon: Icons.calendar_today_outlined,
                    title: 'Sunday 1 June',
                    subtitle: event.time,
                    isDate: true,
                  ),
                  const SizedBox(height: 16),
                  // Location
                  _buildInfoRow(
                    icon: Icons.person_outline,
                    title: 'In Person',
                    subtitle: 'Venue: ${event.venue}',
                  ),
                  const SizedBox(height: 24),
                  // Registration Card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8D5), // Body background
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Strip
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          color: AppColors.primaryLight,
                          child: const Text(
                            'Registration',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6A6A6A),
                            ),
                          ),
                        ),
                        
                        // Content Body
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Approval Required Row
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFADD), // Slightly lighter for icon bg
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.how_to_reg, size: 20, color: AppColors.primary),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'Approval Required',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              
                              // Divider
                              const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5E5)),
                              
                              const SizedBox(height: 20),
                              
                              // Description
                              const Text(
                                'Welcome! To join the event, please register below it may take few days to complete your request. Thank You!',
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.4,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary, // Dark Green
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Request to Join',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // About Event
                  const Text(
                    'About Event',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6A6A6A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kin is throwing a chill hangout this weekend good vibes.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 100), // Bottom padding
                ],
              ),
            ),
            // Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: AppColors.background.withOpacity(0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryLight, size: 18),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Explore Events',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6A6A6A),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_outward, size: 14, color: Color(0xFF6A6A6A)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Navigation Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavBar(
                currentIndex: 0, // Default to Home or make it configurable
                onTap: (index) {
                  // Handle navigation if needed, or just pop back to home
                  if (index == 0) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String asset, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isDate = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.transparent, // Transparent background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
          ),
          child: isDate
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'JUN',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF6A6A6A)),
                    ),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                )
              : Icon(icon, color: Colors.black, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700, // Bolder
                color: Colors.black,
                fontFamily: 'SF Pro Display',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6A6A6A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
