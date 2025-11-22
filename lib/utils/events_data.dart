class EventData {
  final String backgroundImage;
  final String title;
  final String time;
  final String venue;
  final List<String> tags;
  final int attendeesCount;
  final List<String> attendeeAvatars;

  EventData({
    required this.backgroundImage,
    required this.title,
    required this.time,
    required this.venue,
    required this.tags,
    required this.attendeesCount,
    required this.attendeeAvatars,
  });
}

final List<EventData> events = [
  EventData(
    backgroundImage: 'assets/temp/event-image.jpg',
    title: 'Wellness Events by KIN',
    time: '09:45am',
    venue: 'Mumbai, India',
    tags: ['Wellness'],
    attendeesCount: 150,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/kin-events-bg.png',
    title: 'Gathering',
    time: '10:00 AM',
    venue: 'Bandra, Mumbai',
    tags: ['Community'],
    attendeesCount: 45,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/event-image.jpg',
    title: 'Pickleball Match with Mahin',
    time: '11:30 AM',
    venue: 'Stadium',
    tags: ['Sports'],
    attendeesCount: 30,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/kin-classes-bg1.png',
    title: 'Evening Yoga Session',
    time: '06:00 PM',
    venue: 'Powai, Mumbai',
    tags: ['Wellness', 'Classes'],
    attendeesCount: 25,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/kin-classes-bg2.png',
    title: 'Sunday Brunch & Connect',
    time: '11:00 AM',
    venue: 'Lower Parel',
    tags: ['Food', 'Community'],
    attendeesCount: 60,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/event-image.jpg',
    title: 'Morning Run Club',
    time: '06:30 AM',
    venue: 'Marine Drive',
    tags: ['Sports', 'Wellness'],
    attendeesCount: 40,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/kin-events-bg.png',
    title: 'Art & Wine Evening',
    time: '07:00 PM',
    venue: 'Colaba, Mumbai',
    tags: ['Arts', 'Social'],
    attendeesCount: 35,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/kin-classes-bg1.png',
    title: 'Dance Workshop',
    time: '05:00 PM',
    venue: 'Andheri, Mumbai',
    tags: ['Classes', 'Arts'],
    attendeesCount: 28,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
];

// Sample events for event details page routing
final List<EventData> sampleEvents = [
  EventData(
    backgroundImage: 'assets/temp/event-image.jpg',
    title: 'Flutter Workshop',
    time: '10:00 AM',
    venue: 'Tech Hub, Bangalore',
    tags: ['Tech', 'Learning'],
    attendeesCount: 50,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/kin-events-bg.png',
    title: 'AI & ML Conference',
    time: '09:30 AM',
    venue: 'Convention Center, Mumbai',
    tags: ['Tech', 'AI'],
    attendeesCount: 200,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
  EventData(
    backgroundImage: 'assets/temp/kin-classes-bg1.png',
    title: 'Startup Pitch Night',
    time: '06:00 PM',
    venue: 'Co-Working Space, Delhi',
    tags: ['Business', 'Networking'],
    attendeesCount: 75,
    attendeeAvatars: [
      'assets/temp/Frame 1321315995.png',
      'assets/temp/Frame 1321315996.png',
      'assets/temp/Frame 1321315997.png',
    ],
  ),
];
