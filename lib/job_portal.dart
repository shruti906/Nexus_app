import 'package:flutter/material.dart';

class JobPortalPage extends StatefulWidget {
  const JobPortalPage({super.key});

  @override
  State<JobPortalPage> createState() => _JobPortalPageState();
}

class _JobPortalPageState extends State<JobPortalPage> {
  String? _selectedIndustry;
  String? _selectedJobType;

  final List<String> industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Marketing',
    'Engineering'
  ];

  final List<String> jobTypes = [
    'Full-time',
    'Part-time',
    'Internship',
    'Contract',
    'Remote',
  ];

  // Store the list of saved jobs
  final Set<String> _savedJobs = {};

  // Variables for job posting form
  final _jobNameController = TextEditingController();
  final _eligibilityController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _requirementsController = TextEditingController();
  final _vacancyController = TextEditingController();

  bool _isPostingJob = false; // Boolean to control job posting modal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Portal'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to the saved jobs page
              Navigator.pushNamed(context, '/savedJobs');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isPostingJob = true; // Open job posting modal
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for jobs...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Dropdown for filtering by industry
                  DropdownButtonFormField<String>(
                    value: _selectedIndustry,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      labelText: 'Select Industry',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    items: industries.map((String industry) {
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

                  // Dropdown for filtering by job type
                  DropdownButtonFormField<String>(
                    value: _selectedJobType,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      labelText: 'Select Job Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    items: jobTypes.map((String jobType) {
                      return DropdownMenuItem<String>(
                        value: jobType,
                        child: Text(jobType),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedJobType = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Featured Jobs Section
                  const Text(
                    'Featured Jobs',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildJobCard('Senior Software Engineer', 'Google', 'Full-time'),
                  _buildJobCard('Marketing Manager', 'Meta', 'Remote'),
                  _buildJobCard('Product Designer', 'Apple', 'Contract'),

                  const SizedBox(height: 20),

                  // Latest Jobs Section
                  const Text(
                    'Latest Jobs',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildJobCard('Data Scientist', 'Amazon', 'Full-time'),
                  _buildJobCard('Sales Associate', 'Tesla', 'Part-time'),
                  _buildJobCard('Business Analyst', 'Deloitte', 'Internship'),
                ],
              ),
            ),
          ),
          if (_isPostingJob) _buildJobPostingForm(), // Show modal when needed
        ],
      ),
    );
  }

  // A function to create job cards with increased height and save functionality
  Widget _buildJobCard(String title, String company, String jobType) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        constraints: const BoxConstraints(
          maxHeight: 140, // Increased height of the card
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0,3), // Changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            company,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Save Icon (Bookmark)
                  IconButton(
                    icon: Icon(
                      _savedJobs.contains(title)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                    ),
                    color: _savedJobs.contains(title)
                        ? Colors.redAccent
                        : Colors.grey,
                    onPressed: () {
                      setState(() {
                        if (_savedJobs.contains(title)) {
                          _savedJobs.remove(title);
                        } else {
                          _savedJobs.add(title);
                        }
                      });
                    },
                  ),
                  Text(
                    jobType,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Job Posting Modal Form
  Widget _buildJobPostingForm() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPostingJob = false; // Close modal when clicking outside
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.5), // Darken background
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(32),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Post a Job',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Job Name', _jobNameController),
                  _buildTextField('Eligibility Criteria', _eligibilityController),
                  _buildTextField('Description', _descriptionController),
                  _buildTextField('Requirements', _requirementsController),
                  _buildTextField('Vacancy', _vacancyController),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isPostingJob = false; // Close modal on post
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Job Posted Successfully')),
                      );
                    },
                    child: const Text('Post Job'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to create TextFields
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}