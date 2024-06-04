// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:virtual_shop/pages/shop_openning/auth.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  String _selectedCountry = 'Ethiopia'; // Default country

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Where will your business be located?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'We’ll use your location to set up your default shipping rates, recommended apps, and more.',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Country/region',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: _selectedCountry,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountry = newValue!;
                        });
                      },
                      items: <String>['Ethiopia', 'United States', 'Canada', 'United Kingdom', 'Germany']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Handle Submit button press
                    //   },
                    //   child: const Text('Submit'),
                    // ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.black, // Foreground (text) color
        minimumSize: Size(150, 50), // Increased width and height
      ),
      child: const Text('Next'),
    ),
    const SizedBox(height: 10),
    Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle Skip All button press
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.white, // Foreground (text) color
            minimumSize: Size(150, 50), // Increased width and height
          ),
          child: const Text('Skip All'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            // Handle Skip button press
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.white, // Foreground (text) color
            minimumSize: Size(150, 50), // Increased width and height
          ),
          child: const Text('Skip'),
        ),
      ],
    ),
  ],
),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
