import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/events_data.dart';
import '../widgets/event_card.dart';
import '../widgets/filter_row.dart';
import '../widgets/search_bar.dart';

class EventListingPage extends StatefulWidget {
  const EventListingPage({super.key});

  @override
  State<EventListingPage> createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Custom Tab Bar
            Container(
              color: AppColors.background,
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.primary,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: const Color(0xFFAEAEAE),
                    labelStyle: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.1,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.1,
                    ),
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: "Kin Events"),
                      Tab(text: "Kin Classes"),
                    ],
                  ),
                ),
              ),
            ),

            // Search Bar (Static)
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10, bottom: 16, left: 20, right: 20),
              child: const ExploreSearchBar(),
            ),

            // Filters (Static)
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: FilterRow(),
            ),

            // Events List (Only this changes with tabs)
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Kin Events Tab
                  _buildEventsList(),
                  // Kin Classes Tab
                  _buildEventsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsList() {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      itemCount: events.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
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
            // Handle press
          },
        );
      },
    );
  }
}
