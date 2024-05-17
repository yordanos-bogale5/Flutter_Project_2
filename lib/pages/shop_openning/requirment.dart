import 'package:flutter/material.dart';

import 'package:virtual_shop/pages/shop_openning/second.dart';



class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let’s get started. Which of these best describes you?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('We’ll help you get set up based on your business needs.'),
            const SizedBox(height: 40),
            const ChoiceCard(
              title: "I'm just starting",
            ),
            const SizedBox(height: 20),
            const ChoiceCard(
              title: "I’m already selling online or in person",
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Skip All button press
                  },
                  child: const Text('Skip All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Skip button press
                  },
                  child: const Text('Skip'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Next button press
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final String title;

  const ChoiceCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
       onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SecondScreen ()),
    );
  },
      ),
    );
  }
}
