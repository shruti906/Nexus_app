import 'package:flutter/material.dart';

class FeedbackSurveyPage extends StatefulWidget {
  const FeedbackSurveyPage({Key? key}) : super(key: key);

  @override
  _FeedbackSurveyPageState createState() => _FeedbackSurveyPageState();
}

class _FeedbackSurveyPageState extends State<FeedbackSurveyPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedEvent;
  double _rating = 3;
  String? _recommendation;
  String _comments = '';
  bool _anonymous = false;

  // Example events
  List<String> _events = ['Mumbai Alumni Meetup', 'Delhi Annual Reunion', 'Virtual Tech Webinar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback and Survey',style:TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Select Event
              _buildEventDropdown(),

              const SizedBox(height: 20),

              // Rating Slider
              _buildRatingSlider(),

              const SizedBox(height: 20),

              // Would you recommend?
              _buildRecommendationRadio(),

              const SizedBox(height: 20),

              // Comments
              _buildCommentsField(),

              const SizedBox(height: 20),

              // Anonymous Option
              _buildAnonymousCheckbox(),

              const SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission
                    _submitFeedback();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Submit Feedback',
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown to select event
  Widget _buildEventDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Event',
        border: OutlineInputBorder(),
      ),
      items: _events.map((String event) {
        return DropdownMenuItem<String>(
          value: event,
          child: Text(event),
        );
      }).toList(),
      value: _selectedEvent,
      onChanged: (String? newValue) {
        setState(() {
          _selectedEvent = newValue;
        });
      },
      validator: (value) => value == null ? 'Please select an event' : null,
    );
  }

  // Slider for rating
  Widget _buildRatingSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rate the Event:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: _rating,
          min: 1,
          max: 5,
          divisions: 4,
          label: _rating.toString(),
          onChanged: (double value) {
            setState(() {
              _rating = value;
            });
          },
        ),
      ],
    );
  }

  // Radio buttons for recommendation
  Widget _buildRecommendationRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Would you recommend this event?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Yes',
              groupValue: _recommendation,
              onChanged: (String? value) {
                setState(() {
                  _recommendation = value;
                });
              },
            ),
            const Text('Yes'),
            Radio<String>(
              value: 'No',
              groupValue: _recommendation,
              onChanged: (String? value) {
                setState(() {
                  _recommendation = value;
                });
              },
            ),
            const Text('No'),
          ],
        ),
      ],
    );
  }

  // Comments field
  Widget _buildCommentsField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Additional Comments',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      onSaved: (value) {
        _comments = value ?? '';
      },
    );
  }

  // Anonymous checkbox
  Widget _buildAnonymousCheckbox() {
    return CheckboxListTile(
      title: const Text('Submit Anonymously'),
      value: _anonymous,
      onChanged: (bool? value) {
        setState(() {
          _anonymous = value ?? false;
        });
      },
    );
  }

  // Handle form submission
  void _submitFeedback() {
    // Process feedback and send it to the server or database
    print('Feedback submitted:');
    print('Event: $_selectedEvent');
    print('Rating: $_rating');
    print('Recommendation: $_recommendation');
    print('Comments: $_comments');
    print('Anonymous: $_anonymous');

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thank You!'),
          content: const Text('Your feedback has been submitted.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
