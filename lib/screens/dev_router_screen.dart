import 'package:flutter/material.dart';

class DevRouterScreen extends StatelessWidget {
  const DevRouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F3A),
        title: const Text(
          'Dev Router - All Screens',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 8),
              _buildSectionHeader('Main App Screens'),
              const SizedBox(height: 12),
              _buildScreenCard(
                context,
                title: 'Home Screen',
                description: 'Main home page with events',
                route: '/home',
                icon: Icons.home,
                color: Colors.lightGreen,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('Onboarding Screens'),
              const SizedBox(height: 12),
              _buildScreenCard(
                context,
                title: 'Landing Screen',
                description: 'Initial landing page',
                route: '/landing',
                icon: Icons.home_rounded,
                color: Colors.blue,
              ),
              _buildScreenCard(
                context,
                title: 'Invite Screen',
                description: 'Invitation code entry',
                route: '/invite',
                icon: Icons.card_giftcard,
                color: Colors.purple,
              ),
              _buildScreenCard(
                context,
                title: 'Login Screen',
                description: 'User login with email',
                route: '/login',
                icon: Icons.login,
                color: Colors.green,
              ),
              _buildScreenCard(
                context,
                title: 'OTP Screen',
                description: 'OTP verification',
                route: '/otp',
                icon: Icons.password,
                color: Colors.orange,
              ),
              _buildScreenCard(
                context,
                title: 'Get To Know You Screen',
                description: 'User profile setup',
                route: '/get-to-know-you',
                icon: Icons.person,
                color: Colors.pink,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('Quiz Screens'),
              const SizedBox(height: 12),
              _buildScreenCard(
                context,
                title: 'Quiz Screen',
                description: 'Main quiz interface',
                route: '/quiz',
                icon: Icons.quiz,
                color: Colors.teal,
              ),
              _buildScreenCard(
                context,
                title: 'Quiz Multiple Choice',
                description: 'Multiple choice questions',
                route: '/quiz-multiple-choice',
                icon: Icons.question_answer,
                color: Colors.indigo,
              ),
              _buildScreenCard(
                context,
                title: 'Quiz Age Range',
                description: 'Age range selection',
                route: '/quiz-age-range',
                icon: Icons.calendar_today,
                color: Colors.cyan,
              ),
              _buildScreenCard(
                context,
                title: 'Quiz Activities',
                description: 'Activities selection',
                route: '/quiz-activities',
                icon: Icons.sports_basketball,
                color: Colors.amber,
              ),
              _buildScreenCard(
                context,
                title: 'Quiz Conversation',
                description: 'Conversation style selection',
                route: '/quiz-conversation',
                icon: Icons.chat_bubble,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('Event Screens'),
              const SizedBox(height: 12),
              _buildScreenCard(
                context,
                title: 'Event Details Page',
                description: 'Details of a specific event',
                route: '/event-details',
                icon: Icons.event,
                color: Colors.red,
              ),
              _buildScreenCard(
                context,
                title: 'Event Listing Page',
                description: 'List of events with filters',
                route: '/event-listing',
                icon: Icons.list,
                color: Colors.orange,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildScreenCard(
    BuildContext context, {
    required String title,
    required String description,
    required String route,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A1F3A),
            const Color(0xFF1A1F3A).withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.withOpacity(0.3),
                        color.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: color.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withOpacity(0.3),
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
