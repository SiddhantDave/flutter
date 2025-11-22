import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  int _selectedTab = 0; // 0: Kin Events, 1: Kin Classes

  final List<Map<String, dynamic>> _allBookings = [
    {
      'title': 'Enjoyed at Party',
      'time': '2hrs ago',
      'image': 'assets/images/events/party.png',
      'unread': true,
      'type': 'event',
    },
    {
      'title': 'Swimmed at Jasmin House',
      'time': '5hrs ago',
      'image': 'assets/images/events/event.png',
      'unread': false,
      'type': 'event',
    },
    {
      'title': 'Morning Yoga',
      'time': '10hrs ago',
      'image': 'assets/images/events/tennis.png',
      'unread': false,
      'type': 'class',
    },
    {
      'title': 'Concert at Angad House',
      'time': '2hrs ago',
      'image': 'assets/images/events/tennis.png',
      'unread': false,
      'type': 'event',
    },
    {
      'title': 'Gathered at people House',
      'time': '2hrs ago',
      'image': 'assets/images/events/event.png',
      'unread': false,
      'type': 'event',
    },
  ];

  List<Map<String, dynamic>> get _filteredBookings {
    if (_selectedTab == 0) {
      return _allBookings.where((b) => b['type'] == 'event').toList();
    } else {
      return _allBookings.where((b) => b['type'] == 'class').toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Based on screenshot, looks white or very light
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
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
                      const SizedBox(width: 12),
                      const Text(
                        'My Bookings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.done_all,
                        color: AppColors.accent,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Mark all as read',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Tabs
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5), // Light grey for tab background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTab('Kin Events', 0),
                    ),
                    Expanded(
                      child: _buildTab('Kin Classes', 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Your Kin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              // List
              Expanded(
                child: ListView.separated(
                  itemCount: _filteredBookings.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 32,
                    color: Color(0xFFEEEEEE),
                  ),
                  itemBuilder: (context, index) {
                    final booking = _filteredBookings[index];
                    return _buildBookingItem(booking);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingItem(Map<String, dynamic> booking) {
    return Row(
      children: [
        // Unread Indicator
        if (booking['unread'] == true)
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          )
        else
          const SizedBox(width: 18), // Placeholder for alignment

        // Image
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(booking['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        
        // Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                booking['title'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                booking['time'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),

        // Menu
        Theme(
          data: Theme.of(context).copyWith(
            popupMenuTheme: PopupMenuThemeData(
              color: AppColors.primary,
              textStyle: const TextStyle(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.grey[400]),
            offset: const Offset(0, 40),
            onSelected: (value) {
              // Handle menu selection
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'curating',
                child: Text('Curating Kin', style: TextStyle(color: Colors.white)),
              ),
              const PopupMenuItem<String>(
                value: 'cancel',
                child: Row(
                  children: [
                    Icon(Icons.block, color: Colors.white, size: 16),
                    SizedBox(width: 8),
                    Text('Cancel Event', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, color: Colors.white, size: 16),
                    SizedBox(width: 8),
                    Text('Delete', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
