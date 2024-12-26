import 'package:flutter/material.dart';

class SuccessStoriesPage extends StatefulWidget {
  const SuccessStoriesPage({super.key});

  @override
  State<SuccessStoriesPage> createState() => _SuccessStoriesPageState();
}

class _SuccessStoriesPageState extends State<SuccessStoriesPage> {
  // Sample success stories data
  final List<Map<String, String>> successStories = [
    {
      'name': 'Sarah Johnson',
      'headline': 'How Sarah Landed Her Dream Marketing Role in 30 Days',
      'story': 'Sarah had been searching for a marketing role for months...',
      'image': 'assets/images/sarah.jpg',
      'industry': 'Marketing',
    },
    {
      'name': 'John Doe',
      'headline': 'John’s Journey to Becoming a Software Engineer',
      'story': 'John overcame many challenges to break into the tech industry...',
      'image': 'assets/images/john.jpg',
      'industry': 'IT',
    },
    // Add more stories
  ];

  // Function to filter stories by industry
  List<Map<String, String>> filterStoriesByIndustry(String industry) {
    return successStories.where((story) => story['industry'] == industry).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Stories'),
        backgroundColor: Colors.blueAccent,
        actions: [
          // Search button
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SuccessStorySearchDelegate(successStories),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            // Featured Stories Section
            const Text(
              'Featured Stories',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildFeaturedStories(),

            const SizedBox(height: 20),

            // Success Metrics Section
            const Text(
              'Success Metrics',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSuccessMetrics(),

            const SizedBox(height: 20),

            // Real-Time Success Section
            const Text(
              'Real-Time Success',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildRealTimeSuccess(),

            const SizedBox(height: 20),

            // Submit Your Story Section
            _buildSubmitYourStory(),
          ],
        ),
      ),
    );
  }

  // Featured Stories Widget (Cards)
  Widget _buildFeaturedStories() {
    return Column(
      children: successStories.map((story) {
        return GestureDetector(
          onTap: () {
            // Open detailed story page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedStoryPage(story: story),
              ),
            );
          },
          child: Card(
            elevation: 6,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(story['image'] ?? ''),
                radius: 30,
              ),
              title: Text(
                story['headline'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(story['name'] ?? ''),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Success Metrics Widget
  Widget _buildSuccessMetrics() {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Over 500+ successful job placements',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '"This platform helped me land a job in less than a month!" - Jane',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Text(
              '"I found my dream job thanks to the networking hub!" - Alex',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  // Real-Time Success Widget (Ticker)
  Widget _buildRealTimeSuccess() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text('John from New York just got hired as a Software Engineer!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: Card(
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Icon(Icons.campaign, color: Colors.greenAccent),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'John from New York just got hired as a Software Engineer!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(Icons.info_outline, color: Colors.blueAccent),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Add more real-time success notifications
      ],
    );
  }

  // Submit Your Story Widget (Encourage Submissions)
  Widget _buildSubmitYourStory() {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const Icon(Icons.edit, color: Colors.blueAccent),
        title: const Text('Submit Your Story'),
        subtitle: const Text('Share your journey with our community.'),
        onTap: () {
          // Show a submission form popup
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Submit Your Success Story'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Your Name'),
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Your Story'),
                      maxLines: 3,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle submission logic here
                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

// Detailed Story Page (Displays full success story)
class DetailedStoryPage extends StatelessWidget {
  final Map<String, String> story;

  const DetailedStoryPage({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Story'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(story['image'] ?? ''),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text(
              story['headline'] ?? '',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              story['story'] ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Advice for Others',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '"Stay persistent and never give up, even when the challenges seem overwhelming."',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// Search Delegate for searching success stories by name or industry
class SuccessStorySearchDelegate extends SearchDelegate {
  final List<Map<String, String>> stories;

  SuccessStorySearchDelegate(this.stories);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = stories
        .where((story) => story['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results.map((story) {
        return ListTile(
          title: Text(story['name'] ?? ''),
          subtitle: Text(story['headline'] ?? ''),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedStoryPage(story: story),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = stories
        .where((story) => story['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions.map((story) {
        return ListTile(
          title: Text(story['name'] ?? ''),
          subtitle: Text(story['headline'] ?? ''),
        );
      }).toList(),
    );
  }
}
