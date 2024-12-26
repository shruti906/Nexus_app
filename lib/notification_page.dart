import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('New Invitations'),
            _buildNotificationCard(
              context,
              title: '2 New Event Invites',
              subtitle: 'You have been invited to the Annual Alumni Meet and a Tech Webinar.',
              icon: Icons.event_available,
              timestamp: '2 hours ago',
              onTap: () {
                // Navigate to event invites page
              },
              actionText: 'View Events',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Pending Friend Requests'),
            _buildNotificationCard(
              context,
              title: '3 Pending Friend Requests',
              subtitle: 'John Doe, Sarah Connor, and Jane Smith sent you friend requests.',
              icon: Icons.person_add,
              timestamp: '3 hours ago',
              onTap: () {
                // Navigate to friend requests page
              },
              actionText: 'View Requests',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Recent Activities'),
            _buildNotificationCard(
              context,
              title: 'Networking Event Reminder',
              subtitle: 'Join the "Entrepreneurs Meetup" in New York tomorrow.',
              icon: Icons.notifications_active,
              timestamp: '5 hours ago',
              onTap: () {
                // Navigate to event details
              },
              actionText: 'View Details',
            ),
            const SizedBox(height: 20),
            _buildNotificationCard(
              context,
              title: 'Profile Update Alert',
              subtitle: 'Your profile is 80% complete. Update the remaining details for a full profile.',
              icon: Icons.account_circle,
              timestamp: '1 day ago',
              onTap: () {
                // Navigate to profile page
              },
              actionText: 'Update Profile',
            ),
            const SizedBox(height: 20),
            _buildNotificationCard(
              context,
              title: 'New Message from Alumni',
              subtitle: 'You have received a message from Michael Scott.',
              icon: Icons.mail_outline,
              timestamp: '2 days ago',
              onTap: () {
                // Navigate to messages page
              },
              actionText: 'Read Message',
            ),
          ],
        ),
      ),
    );
  }

  // Widget for section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  // Widget for a notification card
  Widget _buildNotificationCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required String timestamp,
        required VoidCallback onTap,
        required String actionText,
      }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: Colors.deepPurple,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(timestamp, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onTap,
          child: Text(actionText),
        ),
        onTap: onTap,
      ),
    );
  }
}
