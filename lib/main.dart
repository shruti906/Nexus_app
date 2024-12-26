import 'package:flutter/material.dart';
import 'job_portal.dart';
import 'login.dart';
import 'signup.dart';
import 'dashboard.dart';
import 'networking_hub.dart';
import 'success_stories.dart';
import 'alumni_directory.dart';
import 'events_and_reunion.dart';
import 'donation_portal.dart';
import 'feedback_survey.dart';
import 'profile_page.dart';
import 'notification_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/dashboard': (context) => const DashboardPage(),
        '/networking_hub': (context) => const NetworkingHubPage(),
        '/job_portal': (context) =>  const JobPortalPage(),
        '/success_stories': (context) =>  SuccessStoriesPage(),
        '/alumni_directory': (context) => const AlumniDirectoryPage(),
        '/events_and_reunion.dart':(context) => const EventsReunionPage(),
        '/donation_portal': (context) => const DonationPortalPage(),
        '/feedback_survey': (context) => const FeedbackSurveyPage(),
        '/profile_page': (context) => ProfilePage(),
        '/notification_page': (context) => const NotificationPage(),
      },// Set the initial route to the login page
    );
  }
}
