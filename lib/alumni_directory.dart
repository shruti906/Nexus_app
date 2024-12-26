import 'package:flutter/material.dart';

class AlumniDirectoryPage extends StatefulWidget {
  const AlumniDirectoryPage({super.key});

  @override
  State<AlumniDirectoryPage> createState() => _AlumniDirectoryPageState();
}

class _AlumniDirectoryPageState extends State<AlumniDirectoryPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';
  String? _selectedBatch;
  String? _selectedIndustry;
  String? _selectedLocation;
  final Map<String, bool> _connectionRequests = {}; // Track connection requests

  final List<Map<String, String>> alumniList = [
    {
      'name': 'John Smith',
      'batch': '2010',
      'industry': 'Technology',
      'location': 'New York',
      'jobRole': 'Software Engineer',
      'bio': 'John is a senior software engineer at Google, focusing on cloud services.',
    },
    {
      'name': 'Emily Davis',
      'batch': '2015',
      'industry': 'Marketing',
      'location': 'San Francisco',
      'jobRole': 'Marketing Specialist',
      'bio': 'Emily works in digital marketing and has a passion for social media strategies.',
    },
    {
      'name': 'Amit Patel',
      'batch': '2017',
      'industry': 'Finance',
      'location': 'Mumbai, India',
      'jobRole': 'Investment Banker',
      'bio': 'Amit works as an investment banker at a leading financial institution in Mumbai.',
    },
    {
      'name': 'Hiroshi Tanaka',
      'batch': '2018',
      'industry': 'Healthcare',
      'location': 'Tokyo, Japan',
      'jobRole': 'Medical Researcher',
      'bio': 'Hiroshi is conducting cutting-edge medical research in Tokyo.',
    },
    {
      'name': 'Chen Wei',
      'batch': '2020',
      'industry': 'Technology',
      'location': 'Beijing, China',
      'jobRole': 'Data Scientist',
      'bio': 'Chen works as a data scientist, analyzing big data for a tech company.',
    },
    // Add more alumni profiles here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumni Directory'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search alumni by name, batch, industry, or location...',
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

            // Filters Section (Batch, Industry, and Location stacked vertically)
            // Dropdown for Batch Year
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Batch',
                border: OutlineInputBorder(),
              ),
              items: [
                for (var year = 2010; year <= 2023; year++)
                  DropdownMenuItem<String>(
                    value: year.toString(),
                    child: Text(year.toString()),
                  )
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBatch = newValue;
                });
              },
            ),
            const SizedBox(height: 10),

            // Dropdown for Industry
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Industry',
                border: OutlineInputBorder(),
              ),
              items: [
                'Technology', 'Marketing', 'Finance', 'Healthcare', 'Education',
                'Consulting', 'Manufacturing', 'Real Estate', 'Retail', 'Law',
                'Government', 'Media & Entertainment', 'Telecommunications'
              ].map((String industry) {
                return DropdownMenuItem<String>(
                  value: industry,
                  child: Text(industry),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedIndustry = newValue;
                });
              },
            ),
            const SizedBox(height: 10),

            // Dropdown for Location
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
              items: [
                'New York', 'San Francisco', 'Mumbai, India', 'Tokyo, Japan',
                'Beijing, China', 'Seoul, South Korea', 'Singapore', 'Kuala Lumpur, Malaysia',
                'Bangkok, Thailand', 'Jakarta, Indonesia', 'London', 'Berlin'
              ].map((String location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLocation = newValue;
                });
              },
            ),
            const SizedBox(height: 20),

            // Recommended Connections Section
            Text('Recommended Connections', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: alumniList
                    .where((alumni) {
                  final searchTermMatch = alumni.values
                      .join(' ')
                      .toLowerCase()
                      .contains(_searchTerm);
                  final batchMatch = _selectedBatch == null ||
                      alumni['batch'] == _selectedBatch;
                  final industryMatch = _selectedIndustry == null ||
                      alumni['industry'] == _selectedIndustry;
                  final locationMatch = _selectedLocation == null ||
                      alumni['location'] == _selectedLocation;

                  return searchTermMatch &&
                      batchMatch &&
                      industryMatch &&
                      locationMatch;
                })
                    .map((alumni) => _buildAlumniCard(context, alumni))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build individual alumni cards
  Widget _buildAlumniCard(BuildContext context, Map<String, String> alumni) {
    final isRequestSent = _connectionRequests[alumni['name']] ?? false;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(alumni['name']![0]), // Just the first letter of the name
        ),
        title: Text(alumni['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${alumni['jobRole']} | ${alumni['industry']}'),
            Text('Batch: ${alumni['batch']} | Location: ${alumni['location']}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            isRequestSent ? Icons.check : Icons.person_add,
            color: isRequestSent ? Colors.green : Colors.blueAccent,
          ),
          onPressed: () {
            if (!isRequestSent) {
              _showConnectionRequestDialog(context, alumni);
            }
          },
        ),
        onTap: () {
          _showAlumniDetails(context, alumni);
        },
      ),
    );
  }

  // Function to show the connection request dialog
  void _showConnectionRequestDialog(BuildContext context, Map<String, String> alumni) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Request Connection'),
          content: Text('Would you like to send a connection request to ${alumni['name']}?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _connectionRequests[alumni['name']!] = true; // Mark the request as sent
                });
                Navigator.pop(context);
              },
              child: Text('Send'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to show alumni details in a dialog
  void _showAlumniDetails(BuildContext context, Map<String, String> alumni) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(alumni['name']!),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  alumni['name']!,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('${alumni['jobRole']} | ${alumni['industry']}'),
                const SizedBox(height: 8),
                Text('Batch: ${alumni['batch']} | Location: ${alumni['location']}'),
                const SizedBox(height: 16),
                Text(alumni['bio']!, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}
