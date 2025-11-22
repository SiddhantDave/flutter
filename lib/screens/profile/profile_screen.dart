import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Back Button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Profile Info
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: NetworkImage('https://i.pravatar.cc/300'), // Placeholder
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.grey.shade200, width: 1),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Samuel Obreoi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // My Profile Section
              _buildSectionHeader('MY PROFILE'),
              const SizedBox(height: 12),
              _buildMenuContainer([
                _buildMenuItem(context, 'Profile Details', onTap: () {
                  Navigator.pushNamed(context, '/profile-details');
                }),
                _buildDivider(),
                _buildMenuItem(context, 'My Bookings', onTap: () {}),
              ]),

              const SizedBox(height: 24),

              // Support Section
              _buildSectionHeader('SUPPORT'),
              const SizedBox(height: 12),
              _buildMenuContainer([
                _buildMenuItem(context, 'Email Support', onTap: () {}),
                _buildDivider(),
                _buildMenuItem(context, 'Terms of Use', onTap: () {}),
                _buildDivider(),
                _buildMenuItem(context, 'Privacy Policy', onTap: () {}),
              ]),

              const SizedBox(height: 24),

              // Spread the World Section
              _buildSectionHeader('SPREAD THE WORLD'),
              const SizedBox(height: 12),
              _buildMenuContainer([
                _buildMenuItem(context, 'Follow us on Instagram', onTap: () {}),
                _buildDivider(),
                _buildMenuItem(context, 'Follow us on Facebook', onTap: () {}),
                _buildDivider(),
                _buildMenuItem(context, 'Rate our app', onTap: () {}),
              ]),

              const SizedBox(height: 24),

              // Account Section
              _buildSectionHeader('ACCOUNT'),
              const SizedBox(height: 12),
              _buildMenuContainer([
                _buildMenuItem(context, 'Logout', onTap: () {}),
                _buildDivider(),
                _buildMenuItem(context, 'Delete Account', textColor: Colors.red, onTap: () {}),
              ]),
              
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildMenuContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light grey background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, {Color? textColor, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.black87,
              ),
            ),
            if (textColor == null) // Don't show arrow for "Delete Account" if implied by design, but usually yes. Image shows arrows for top items.
            // Actually image shows arrows for all items except maybe logout/delete? 
            // Let's look closely at the image.
            // Profile Details >
            // My Bookings >
            // Email Support (no arrow visible in low res, but likely yes)
            // Let's assume arrows for navigation items.
            // Delete Account usually doesn't have an arrow if it's an action, but might.
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFE0E0E0),
      indent: 16,
      endIndent: 16,
    );
  }
}
