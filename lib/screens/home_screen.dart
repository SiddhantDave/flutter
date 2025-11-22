import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colors.dart';
import '../utils/events_data.dart';
import '../widgets/event_card.dart';
import '../widgets/explore_card.dart';
import '../widgets/page_indicator.dart';
import '../widgets/bottom_nav_bar.dart';
import 'event_details/event_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentNavIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // Remove back button
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Image.asset(
          'assets/images/logo.png',
          height: 32,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            
            // Greeting with emoji
            const Text(
              'Good Morning, Preet 👋',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 14),

            // Featured Events Section (Carousel)
            SizedBox(
              height: 182,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return EventCard(
                    backgroundImage: event.backgroundImage,
                    title: event.title,
                    time: event.time,
                    venue: event.venue,
                    tags: event.tags,
                    attendeesCount: event.attendeesCount,
                    attendeeAvatars: event.attendeeAvatars,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsPage(event: event),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 6),

            // Page Indicator
            PageIndicator(
              currentPage: _currentPage,
              totalPages: events.length,
            ),
            const SizedBox(height: 20),

            // Explore Section
            const Text(
              'Explore your Kin',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 14),

            // Explore Cards
            Row(
              children: [
                ExploreCard(
                  backgroundImage: 'assets/images/home/kin-events.jpg',
                  title: 'Upcoming Events',
                  onPress: () {
                    Navigator.pushNamed(context, '/event-listing');
                  },
                ),
                const SizedBox(width: 16),
                ExploreCard(
                  backgroundImage: 'assets/images/home/kin-classes.jpg',
                  title: 'Wellness Sessions',
                  onPress: () {
                    Navigator.pushNamed(context, '/event-listing');
                  },
                ),
              ],
            ),

            const Spacer(),

            // Footer
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Live it up!',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    color: Color(0xFF8A8E89),
                    height: 0.96,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text(
                      'Crafted with ',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF8A8E89),
                        height: 0.94,
                      ),
                    ),
                    const Text(
                      '❤️',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFF94848),
                      ),
                    ),
                    const Text(
                      ' in Mumbai, India',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF8A8E89),
                        height: 0.94,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }
}
