import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;
  String name = "Shruti Keshri";
  String about = "Passionate about technology and coding. Love to work on Flutter projects!";
  String age = "25"; // Example age
  String contact = "9876543210"; // Example contact
  String email = "shrtikeshri453@gmail.com";
  String college = "XYZ University";
  String company = "ABC Tech"; // Example company
  String graduationYear = "2022"; // Example graduation year

  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController graduationYearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    aboutController.text = about;
    ageController.text = age;
    contactController.text = contact;
    emailController.text = email;
    collegeController.text = college;
    companyController.text = company;
    graduationYearController.text = graduationYear;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/circle.jpeg'),
            ),
            SizedBox(height: 20),

            // Name
            isEditing
                ? TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Full Name",
              ),
            )
                : Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Email
            isEditing
                ? TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            )
                : Text(
              email,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),

            // About Section
            isEditing
                ? TextField(
              controller: aboutController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "About",
              ),
            )
                : Text(
              about,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Editable fields with no placeholder but inside rectangular boxes
            _buildEditableField('Age', ageController),
            _buildEditableField('College', collegeController),
            _buildEditableField('Contact', contactController),
            _buildEditableField('Company', companyController),
            _buildEditableField('Graduation Year', graduationYearController),
            SizedBox(height: 40),

            // Edit Profile button
            isEditing
                ? ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  about = aboutController.text;
                  age = ageController.text;
                  contact = contactController.text;
                  email = emailController.text;
                  college = collegeController.text;
                  company = companyController.text;
                  graduationYear = graduationYearController.text;
                  isEditing = false;

                  // Showing a "Changes Saved" pop-up
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Changes Saved'),
                  ));
                });
              },
              icon: Icon(Icons.save),
              label: Text('Save Changes'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            )
                : ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build editable fields with a rectangular box
  Widget _buildEditableField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: isEditing
          ? TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            controller.text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
