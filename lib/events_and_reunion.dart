import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Make sure this is imported after adding to pubspec.yaml

class EventsReunionPage extends StatefulWidget {
  const EventsReunionPage({Key? key}) : super(key: key);

  @override
  _EventsReunionPageState createState() => _EventsReunionPageState();
}

class _EventsReunionPageState extends State<EventsReunionPage> {
  final List<Map<String, dynamic>> eventsList = [
    {
      'title': 'Mumbai Alumni Meetup',
      'date': DateTime(2024, 9, 20),
      'location': 'Mumbai, India',
      'eventType': 'Networking',
      'description': 'Reconnect with fellow alumni and expand your network.',
      'isVirtual': false,
    },
    {
      'title': 'Virtual Tech Webinar',
      'date': DateTime(2024, 9, 25),
      'location': 'Virtual',
      'eventType': 'Webinar',
      'description': 'Explore the latest trends in AI and Machine Learning.',
      'isVirtual': true,
    },
    {
      'title': 'Delhi Annual Alumni Reunion',
      'date': DateTime(2024, 10, 5),
      'location': 'Delhi, India',
      'eventType': 'Reunion',
      'description': 'Join us for an exciting alumni reunion in Delhi.',
      'isVirtual': false,
    },
    {
      'title': 'Bangalore Startup Conference',
      'date': DateTime(2024, 10, 12),
      'location': 'Bangalore, India',
      'eventType': 'Conference',
      'description': 'Engage with startups and industry leaders.',
      'isVirtual': false,
    },
    {
      'title': 'Pune Social Gathering',
      'date': DateTime(2024, 11, 10),
      'location': 'Pune, India',
      'eventType': 'Social',
      'description': 'Join us for a casual social gathering.',
      'isVirtual': false,
    },
    {
      'title': 'Hyderabad Entrepreneurship Forum',
      'date': DateTime(2024, 11, 18),
      'location': 'Hyderabad, India',
      'eventType': 'Conference',
      'description': 'Meet industry leaders and upcoming entrepreneurs.',
      'isVirtual': false,
    },
    {
      'title': 'Virtual Marketing Trends Webinar',
      'date': DateTime(2024, 11, 22),
      'location': 'Virtual',
      'eventType': 'Webinar',
      'description': 'Dive into 2025 marketing trends with experts.',
      'isVirtual': true,
    },
    {
      'title': 'New York Business Leaders Summit',
      'date': DateTime(2024, 12, 2),
      'location': 'New York, USA',
      'eventType': 'Conference',
      'description': 'A platform for business leaders to share insights.',
      'isVirtual': false,
    },
    {
      'title': 'Sydney Annual Picnic',
      'date': DateTime(2024, 12, 10),
      'location': 'Sydney, Australia',
      'eventType': 'Social',
      'description': 'A relaxing picnic day with alumni in Sydney.',
      'isVirtual': false,
    },
  ];

  String? _selectedEventType;
  String? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events and Reunions'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filters Section
            _buildFilters(context),

            const SizedBox(height: 20),

            // Upcoming Events Title
            const Text(
              'Upcoming Events',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            // Event List
            Expanded(
              child: ListView(
                children: eventsList
                    .where((event) {
                  final eventTypeMatch = _selectedEventType == null ||
                      event['eventType'] == _selectedEventType;
                  final locationMatch = _selectedLocation == null ||
                      event['location'] == _selectedLocation;
                  return eventTypeMatch && locationMatch;
                })
                    .map((event) => _buildEventCard(context, event))
                    .toList(),
              ),
            ),

            // Create Event Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button background color set to white
                  foregroundColor: Colors.deepPurple, // Text color
                ),
                onPressed: () {
                  _showCreateEventDialog(context);
                },
                child: const Text('Create Event'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filters for event type and location
  Widget _buildFilters(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown for Event Type
        _buildDropdown(
          label: 'Event Type',
          items: ['Reunions', 'Networking', 'Conferences', 'Webinars', 'Socials'],
          value: _selectedEventType,
          onChanged: (String? newValue) {
            setState(() {
              _selectedEventType = newValue;
            });
          },
        ),
        const SizedBox(height: 10),

        // Dropdown for Location
        _buildDropdown(
          label: 'Location',
          items: ['Mumbai, India', 'Delhi, India', 'Bangalore, India', 'Pune, India', 'Hyderabad, India', 'Virtual', 'New York, USA', 'Sydney, Australia'],
          value: _selectedLocation,
          onChanged: (String? newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
        ),
      ],
    );
  }

  // Dropdown builder for filters
  Widget _buildDropdown({
    required String label,
    required List<String> items,
    required String? value,
    required Function(String?) onChanged,
  }) {
    return SizedBox(
      width: 300,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  // Event card widget
  Widget _buildEventCard(BuildContext context, Map<String, dynamic> event) {
    final dateFormat = DateFormat.yMMMd(); // For formatting event dates
    final eventDate = dateFormat.format(event['date']);
    final isVirtual = event['isVirtual'];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          isVirtual ? Icons.wifi : Icons.location_on,
          color: Colors.deepPurple,
        ),
        title: Text(
          event['title'],
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event['description']),
            Text('Date: $eventDate | Location: ${event['location']}'),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // Button background color
            foregroundColor: Colors.white, // Text color
          ),
          onPressed: () {
            _showInviteSent(context);
          },
          child: const Text('Invite Friends'),
        ),
      ),
    );
  }

  // Show invite sent message
  void _showInviteSent(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invite Sent!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Show create event dialog
  void _showCreateEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'Event Name')),
              TextField(decoration: const InputDecoration(labelText: 'Date')),
              TextField(decoration: const InputDecoration(labelText: 'Time')),
              TextField(decoration: const InputDecoration(labelText: 'Venue')),
              TextField(decoration: const InputDecoration(labelText: 'Description')),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Button background color
                  foregroundColor: Colors.white, // Text color
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Event Created!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Create Event'),
              ),
            ],
          ),
        );
      },
    );
  }
}
