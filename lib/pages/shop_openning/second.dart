
import 'package:flutter/material.dart';



class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
        title: Text('Get Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let’s get started. Which of these best describes you?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('We’ll help you get set up based on your business needs.'),
            SizedBox(height: 40),
            ChoiceCard(
              title: "I'm just starting",
              isSelected: _selectedOption == 0,
              onTap: () => _selectOption(0),
            ),
            SizedBox(height: 20),
            ChoiceCard(
              title: "I’m already selling online or in person",
              isSelected: _selectedOption == 1,
              onTap: () => _selectOption(1),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Skip All button press
                  },
                  child: Text('Skip All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Skip button press
                  },
                  child: Text('Skip'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Next button press
                  },
                  child: Text('Next'),
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

  ChoiceCard({required this.title, required this.isSelected, required this.onTap});

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
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 12,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            SizedBox(width: 10),
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
