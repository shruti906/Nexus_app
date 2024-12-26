import 'package:flutter/material.dart';

class NetworkingHubPage extends StatefulWidget {
  const NetworkingHubPage({super.key});

  @override
  _NetworkingHubPageState createState() => _NetworkingHubPageState();
}

class _NetworkingHubPageState extends State<NetworkingHubPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking Hub'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name, batch, or industry...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchTerm = _searchController.text.toLowerCase();
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Alumni Connections',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  _buildAlumniCard(context, 'John Smith', 'Software Engineer', 'Batch 2010', 'Technology', 'assets/images/formal_profile_1.png'),
                  _buildAlumniCard(context, 'Emily Davis', 'Marketing Specialist', 'Batch 2015', 'Marketing', 'assets/images/formal_profile_2.png'),
                  _buildAlumniCard(context, 'Michael Brown', 'Data Scientist', 'Batch 2012', 'Data', 'assets/images/formal_profile_3.png'),
                  _buildAlumniCard(context, 'Sophia Wilson', 'Graphic Designer', 'Batch 2018', 'Design', 'assets/images/formal_profile_4.png'),
                  _buildAlumniCard(context, 'David Johnson', 'Finance Analyst', 'Batch 2013', 'Finance', 'assets/images/formal_profile_5.png'),
                  _buildAlumniCard(context, 'Olivia Martinez', 'HR Manager', 'Batch 2017', 'Human Resources', 'assets/images/formal_profile_6.png'),
                  _buildAlumniCard(context, 'Liam Thompson', 'IT Consultant', 'Batch 2016', 'Consulting', 'assets/images/formal_profile_7.png'),
                  _buildAlumniCard(context, 'Emma Hernandez', 'Operations Manager', 'Batch 2014', 'Operations', 'assets/images/formal_profile_8.png'),
                ].where((alumniCard) {
                  return alumniCard
                      .toString()
                      .toLowerCase()
                      .contains(_searchTerm);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlumniCard(
      BuildContext context,
      String name,
      String profession,
      String batch,
      String industry,
      String imagePath,
      ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profession),
            Text('$batch | $industry'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
              onPressed: () {
                // Logic for viewing PDF resume (can be implemented later)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Opening $name's resume...")),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.blueAccent),
              onPressed: () {
                _openChatWindow(context, name);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to open the chat window sliding from the right side
  void _openChatWindow(BuildContext context, String name) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ChatPage(name: name),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}

// Chat Page (Sliding from the right)
class ChatPage extends StatelessWidget {
  final String name;

  const ChatPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $name'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text('Chat messages will appear here.'),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  // Function to build the chat message input field
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.blueAccent),
            onPressed: () {
              // Add voice message functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.green),
            onPressed: () {
              // Add camera functionality
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blueAccent),
            onPressed: () {
              // Add send message functionality
            },
          ),
        ],
      ),
    );
  }
}
