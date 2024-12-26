import 'package:flutter/material.dart';
import 'alumni_directory.dart';
import 'donation_portal.dart';
import 'events_and_reunion.dart'; // Import the Events and Reunion page
import 'networking_hub.dart';
import 'job_portal.dart';
import 'success_stories.dart';
import 'feedback_survey.dart';
import 'profile_page.dart';
import 'notification_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hi, Shruti',
          style: TextStyle(
            fontFamily: 'SansitaSwashed',
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/circle.jpeg'),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: _buildDrawer(context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                // Image on the left side
                Image.asset(
                  'assets/images/app.png', // Use your image file path
                  height: 150,
                ),
                const SizedBox(width: 20),

                // Animated Text on the right side
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Connecting The PAST, With the FUTURE',
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 4,
                      pause: const Duration(milliseconds: 500),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              'Statistics and Insights',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JobPortalPage()),
                    );
                  },
                  child: _buildStatCard(
                    context,
                    title: 'New Jobs',
                    value: '23',
                    icon: Icons.work,
                    backgroundColor: Colors.lightGreen[50],
                    iconColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EventsReunionPage()),
                    );
                  },
                  child: _buildStatCard(
                    context,
                    title: 'Events This Year',
                    value: '15',
                    icon: Icons.event,
                    backgroundColor: Colors.orange[50],
                    iconColor: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.notifications, color: Colors.blueAccent, size: 28),
                SizedBox(width: 8),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildNotificationsPanel(),
            const SizedBox(height: 20),
            const Text(
              'Alumni Spotlight',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFeaturedAlumniStory(),
            const SizedBox(height: 20),
            const Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildUpcomingEvents(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/white_logo.png',
                  width: 60,
                  height: 80,
                ),
                const SizedBox(width: 10),
                const Text(
                  'NEXUS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
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
            leading: const Icon(Icons.people),
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
            leading: const Icon(Icons.favorite),
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

  Widget _buildNotificationsPanel() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.event_available),
              title: Text('You have 2 new event invites'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text('3 pending friend requests'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildStatCard(BuildContext context,
      {required String title,
        required String value,
        required IconData icon,
        Color? backgroundColor,
        Color? iconColor}) {
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

  Widget _buildWeatherWidget() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: const [
            Icon(Icons.wb_sunny, size: 30, color: Colors.orange),
            SizedBox(width: 10),
            Text(
              '28°C, Sunny',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'New York, NY',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedAlumniStory() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Jane Doe: From Internship to CEO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Jane\'s journey from being an intern at XYZ Corp to becoming the CEO is an inspiring tale of hard work and dedication.',
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Navigate to the full story page
              },
              child: const Text(
                'Read More',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return const Card(
      elevation: 4,
      child: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Annual Alumni Meet - March 2024'),
              subtitle: Text('Join us for the annual meet in New York.'),

            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Alumni Webinar: The Future of AI - April 2024'),
              subtitle: Text('Join experts as they discuss the future of AI.'),

            ),
          ],
        ),
      ),
    );
  }
}
