import 'package:flutter/material.dart';
import 'signup.dart'; // Import the SignUpPage
import 'dashboard.dart'; // Import the DashboardPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true; // To toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/bg.jpeg', // Background image path
              fit: BoxFit.cover,
            ),
          ),
          // Login form
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/transparent_logo.png', // Logo image path
                              height: 50, // Adjust the height as needed
                            ),
                            const SizedBox(width: 10), // Space between logo and text
                            const Text(
                              'NEXUS',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40), // Increased space between NEXUS and Login
                        const Text(
                          'Login',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40), // Adds spacing between elements
                  const Text(
                    'Username',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8), // Adds spacing between text and text field
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.6), // Colorless white
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Adds spacing between text fields
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8), // Adds spacing between text and text field
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscureText, // Controls password visibility
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.6), // Reduced opacity
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none, // No border
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText; // Toggle password visibility
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Adds spacing before the button
                  Center(
                    child: SizedBox(
                      width: 250, // Width of the login button
                      height: 50, // Height of the login button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.85), // Match button opacity with text fields
                          foregroundColor: Colors.black, // Button text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          // Handle the login logic here
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          // Simulate successful login for now
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700, // Increased font weight
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Adds spacing before the sign-up text
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the Sign-Up Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: const TextStyle(
                                color: Colors.blue, // Set the color of 'Sign up' text to blue
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}