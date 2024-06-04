import 'package:flutter/material.dart';
import 'package:virtual_shop/pages/shop_openning/second.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  int _selectedOption = -1;

  void _selectOption(int index) {
    setState(() {
      _selectedOption = index;
    });
  }

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
            ChoiceCard(
              title: "I'm just starting",
              isSelected: _selectedOption == 0,
              onTap: () => _selectOption(0),
            ),
            const SizedBox(height: 20),
            ChoiceCard(
              title: "I’m already selling online or in person",
              isSelected: _selectedOption == 1,
              onTap: () => _selectOption(1),
            ),
            const Spacer(),
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
          MaterialPageRoute(builder: (context) => const MultiSelectScreen()),
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

class ChoiceCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceCard({super.key, required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 12,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
