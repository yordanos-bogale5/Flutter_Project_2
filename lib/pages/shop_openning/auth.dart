import 'package:flutter/material.dart';
import 'package:virtual_shop/pages/shop_openning/owner_dashboard.dart';

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'One last step to open your shop.',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Google sign-up button press
                      },
                      icon: const Icon(Icons.account_circle),
                      label: const Text('Sign up with Google'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Facebook sign-up button press
                      },
                      icon: const Icon(Icons.facebook),
                      label: const Text('Sign up with Facebook'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen ()));
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
