import 'package:flutter/material.dart';

class DonationPortalPage extends StatefulWidget {
  const DonationPortalPage({Key? key}) : super(key: key);

  @override
  _DonationPortalPageState createState() => _DonationPortalPageState();
}

class _DonationPortalPageState extends State<DonationPortalPage> {
  String? _selectedCategory;
  String? _donationType;
  double _donationAmount = 500;
  bool _isRecurring = false;
  String? _selectedPaymentMethod;
  bool _taxReceiptGenerated = false;

  final List<Map<String, dynamic>> donationCategories = [
    {'name': 'Scholarships', 'description': 'Support for student scholarships.'},
    {'name': 'Infrastructure', 'description': 'Help build better infrastructure.'},
    {'name': 'Research', 'description': 'Contribute to cutting-edge research.'},
    {'name': 'Student Support', 'description': 'Assist students in need.'},
  ];

  final List<Map<String, dynamic>> donationHistory = [
    {'date': '01-Sep-2024', 'cause': 'Scholarships', 'amount': 1000},
    {'date': '15-Aug-2024', 'cause': 'Infrastructure', 'amount': 5000},
  ];

  final List<String> paymentMethods = [
    'Credit Card',
    'Debit Card',
    'UPI',
    'Net Banking',
    'PayPal',
    'Offline Payment (Bank Transfer)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Portal'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Donation Categories
            const Text(
              'Donation Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            _buildCategoryDropdown(),
            const SizedBox(height: 20),

            // Donation Amount Selection
            const Text(
              'Donation Amount',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            _buildAmountSelection(),
            const SizedBox(height: 20),

            // One-Time or Recurring Donation
            _buildRecurringDonationToggle(),
            const SizedBox(height: 20),

            // Payment Methods
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            _buildPaymentDropdown(),
            const SizedBox(height: 20),

            // Donation History Section
            const Text(
              'Donation History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            _buildDonationHistory(),
            const SizedBox(height: 20),

            // Submit Donation Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: _handleDonation,
              child: const Text('Donate Now'),
            ),

            // Display Tax Receipt
            if (_taxReceiptGenerated)
              const Text(
                'Tax receipt has been generated for your donation!',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }

  // Dropdown for Donation Categories
  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Choose Cause',
        border: OutlineInputBorder(),
      ),
      items: donationCategories.map((category) {
        return DropdownMenuItem<String>(
          value: category['name'],
          child: Text(category['name']),
        );
      }).toList(),
      value: _selectedCategory,
      onChanged: (String? newValue) {
        setState(() {
          _selectedCategory = newValue;
        });
      },
    );
  }

  // Amount Selection Widget
  Widget _buildAmountSelection() {
    return Column(
      children: [
        Row(
          children: [
            _buildAmountButton(500),
            _buildAmountButton(1000),
            _buildAmountButton(5000),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter Custom Amount',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                _donationAmount = double.tryParse(value) ?? 500;
              });
            }
          },
        ),
      ],
    );
  }

  // Predefined Donation Amount Button
  Widget _buildAmountButton(double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _donationAmount == amount ? Colors.deepPurple : Colors.grey[300],
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _donationAmount = amount;
          });
        },
        child: Text('₹$amount'),
      ),
    );
  }

  // Recurring Donation Toggle
  Widget _buildRecurringDonationToggle() {
    return SwitchListTile(
      title: const Text('Set up Recurring Donation?'),
      value: _isRecurring,
      onChanged: (bool value) {
        setState(() {
          _isRecurring = value;
        });
      },
    );
  }

  // Payment Method Dropdown
  Widget _buildPaymentDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Payment Method',
        border: OutlineInputBorder(),
      ),
      items: paymentMethods.map((method) {
        return DropdownMenuItem<String>(
          value: method,
          child: Text(method),
        );
      }).toList(),
      value: _selectedPaymentMethod,
      onChanged: (String? newValue) {
        setState(() {
          _selectedPaymentMethod = newValue;
        });
      },
    );
  }

  // Donation History List
  Widget _buildDonationHistory() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: donationHistory.length,
      itemBuilder: (context, index) {
        final history = donationHistory[index];
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text('Cause: ${history['cause']}'),
            subtitle: Text('Date: ${history['date']} | Amount: ₹${history['amount']}'),
          ),
        );
      },
    );
  }

  // Handle Donation Submission
  void _handleDonation() {
    setState(() {
      _taxReceiptGenerated = true; // Simulate generating a tax receipt
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Donation successful!')),
    );
  }
}
