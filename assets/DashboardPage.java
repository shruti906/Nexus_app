import 'package:flutter/material.dart';
import 'alumni_directory.dart'; // Import the Alumni Directory page
import 'donation_portal.dart';
import 'events_and_reunion.dart';
import 'networking_hub.dart'; // Assuming this exists
import 'job_portal.dart'; // Import the Job Portal page
import 'success_stories.dart'; // Import Success Stories page
import 'feedback_survey.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(
                title: const Text('Dashboard'),
                backgroundColor: Colors.blueAccent,
                actions: [
        // Profile Image Button with Dropdown
        PopupMenuButton<int>(
                icon: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://www.example.com/profile-pic.jpg'), // Replace with user's image
            ),
        onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Go to Profile'),
              ),
            ],
          ),
        ],
      ),
        drawer: _buildDrawer(context), // Added the side menu bar (drawer)
                backgroundColor: Colors.white, // Set background color to white
                body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                children: [
            const SizedBox(height: 20),

        // Notifications and Pending Actions
        _buildNotificationsPanel(),

            const SizedBox(height: 20),

        // Title section for Statistics
            const Text(
                'Statistics and Insights',
                style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

        // Statistics Cards
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
        _buildStatCard(
                context,
                title: 'Active Users',
                value: '1,245',
                icon: Icons.people,
                backgroundColor: Colors.lightBlue[50],
                iconColor: Colors.blueAccent,
                ),
        _buildStatCard(
                context,
                title: 'New Jobs',
                value: '23',
                icon: Icons.work,
                backgroundColor: Colors.lightGreen[50],
                iconColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 20),
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
        _buildStatCard(
                context,
                title: 'Events This Year',
                value: '15',
                icon: Icons.event,
                backgroundColor: Colors.orange[50],
                iconColor: Colors.orangeAccent,
                ),
              ],
            ),
            const SizedBox(height: 20),

        // Upcoming Events Section
        _buildUpcomingEvents(),

            const SizedBox(height: 20),

        // Featured Success Stories
        _buildFeaturedAlumniStory(),

            const SizedBox(height: 20),

        // Weather Widget (if events are location-based)
        _buildWeatherWidget(),
          ],
        ),
      ),
    );
    }

    // Profile Dropdown Selection Functionality
    void onSelected(BuildContext context, int item) {
        switch (item) {
            case 0:
                // Navigate to Profile Page
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()), // ProfilePage is a placeholder
        );
                break;
        }
    }

    // Notifications Panel Widget
    Widget _buildNotificationsPanel() {
        return Card(
                elevation: 4,
                child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            const Text(
                'Notifications',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
        ListTile(
                leading: Icon(Icons.event_available),
                title: Text('You have 2 new event invites'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
            // Navigate to Event Invitations Page
        },
            ),
        ListTile(
                leading: Icon(Icons.mail_outline),
                title: Text('3 pending friend requests'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
            // Navigate to Friend Requests Page
        },
            ),
          ],
        ),
      ),
    );
    }

    // A function to create statistic cards
    Widget _buildStatCard(BuildContext context, {
        required String title,
                required String value,
        required IconData icon,
                Color? backgroundColor,
                Color? iconColor,
    }) {
        return Card(
                color: backgroundColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
      ),
        child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                children: [
        Icon(
                icon,
                size: 40,
                color: iconColor,
            ),
            const SizedBox(height: 8),
        Text(
                title,
                style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
        Text(
                value,
                style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    }

    // Upcoming Events Widget
    Widget _buildUpcomingEvents() {
        return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        const Text(
                'Upcoming Events',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
                leading: Icon(Icons.event),
                title: Text('Alumni Reunion - Class of 2010'),
                subtitle: Text('Date: 12th Dec | Location: University Campus'),
                trailing: ElevatedButton(
                onPressed: () {
            // RSVP functionality
        },
        child: Text('RSVP'),
          ),
        ),
        ListTile(
                leading: Icon(Icons.event),
                title: Text('Tech Webinar'),
                subtitle: Text('Date: 5th Jan | Virtual Event'),
                trailing: ElevatedButton(
                onPressed: () {
            // RSVP functionality
        },
        child: Text('RSVP'),
          ),
        ),
      ],
    );
    }

    // Featured Success Story Widget
    Widget _buildFeaturedAlumniStory() {
        return Card(
                elevation: 4,
                child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
        Text(
                'Alumni Spotlight: Jane Smith',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
        SizedBox(height: 10),
        Text(
                'Jane Smith, Class of 2008, is now a CEO at ABC Tech and was recently recognized as one of the top leaders in the tech industry.',
                ),
                SizedBox(height: 10),
        Text(
                'Read More',
                style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
    }

    // Weather Widget (if events are location-based)
    Widget _buildWeatherWidget() {
        return Card(
                elevation: 4,
                child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                children: const [
        Icon(Icons.wb_sunny, size: 40, color: Colors.orangeAccent),
        SizedBox(width: 16),
        Text(
                'Sunny, 25°C',
                style: TextStyle(fontSize: 18),
            ),
        Spacer(),
                Text('Location: XYZ City'),
          ],
        ),
      ),
    );
    }

    // Side menu bar (Drawer)
    Widget _buildDrawer(BuildContext context) {
        return Drawer(
                child: ListView(
                padding: EdgeInsets.zero,
                children: [
        DrawerHeader(
                decoration: const BoxDecoration(
                color: Colors.blueAccent,
            ),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
        Text(
                'Menu',
                style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ListTile(
                leading: const Icon(Icons.network_cell),
                title: const Text('Networking Hub'),
                onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NetworkingHubPage()),
              );
        },
          ),
        ListTile(
                leading: const Icon(Icons.work),
                title: const Text('Job Portal'),
                onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JobPortalPage()),
              );
        },
          ),
        ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Success Stories'),
                onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SuccessStoriesPage()),
              );
        },
          ),
        ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Alumni Directory'),
                onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AlumniDirectoryPage()),
              );
        },
          ),
        ListTile(
                leading: const Icon(Icons.event),
                title: const Text('Events & Reunion'),
                onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EventsReunionPage()),
              );
        },
          ),
        ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Donation Portal'),
                onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DonationPortalPage()),
              );
        },
          ),
        ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Feedback & Survey'),
                onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedbackSurveyPage()),
              );
        },
          ),
        ],
      ),
    );
    }
}
