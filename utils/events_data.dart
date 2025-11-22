// Sample event data used by the app
// Define a simple EventData model and a list of sample events.

class EventData {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String imageUrl;

  EventData({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
  });
}

// A handful of dummy events for development/testing purposes.
final List<EventData> sampleEvents = [
  EventData(
    id: '1',
    title: 'Flutter Workshop',
    description: 'A hands‑on workshop exploring Flutter widgets and state management.',
    date: DateTime(2025, 12, 5, 10, 0),
    location: 'Tech Hub, Bangalore',
    imageUrl: 'https://picsum.photos/seed/flutter1/400/200',
  ),
  EventData(
    id: '2',
    title: 'AI & ML Conference',
    description: 'Industry leaders discuss the future of artificial intelligence.',
    date: DateTime(2025, 12, 12, 9, 30),
    location: 'Convention Center, Mumbai',
    imageUrl: 'https://picsum.photos/seed/ai2/400/200',
  ),
  EventData(
    id: '3',
    title: 'Startup Pitch Night',
    description: 'Entrepreneurs pitch their ideas to investors.',
    date: DateTime(2025, 12, 20, 18, 0),
    location: 'Co‑Working Space, Delhi',
    imageUrl: 'https://picsum.photos/seed/startup3/400/200',
  ),
];
