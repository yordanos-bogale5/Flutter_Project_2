import 'package:flutter/material.dart';
import 'package:virtual_shop/pages/shop_openning/third.dart';

class MultiSelectScreen extends StatefulWidget {
  const MultiSelectScreen({super.key});

  @override
  _MultiSelectScreenState createState() => _MultiSelectScreenState();
}

class _MultiSelectScreenState extends State<MultiSelectScreen> {
  final List<bool> _selections = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Where would you like to sell?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pick as many as you like – you can always change these later. We\'ll make sure you\'re set up to sell in these places.',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    SelectableOption(
                      title: 'An online store',
                      description: 'Create a virtual shop',
                      isSelected: _selections[0],
                      onChanged: (value) {
                        setState(() {
                          _selections[0] = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SelectableOption(
                      title: 'In person',
                      description: 'Sell at retail stores, pop-ups, or other physical locations',
                      isSelected: _selections[1],
                      onChanged: (value) {
                        setState(() {
                          _selections[1] = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    // SelectableOption(
                    //   title: 'An existing website or blog',
                    //   description: 'Add a Buy Button to your website',
                    //   isSelected: _selections[2],
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selections[2] = value!;
                    //     });
                    //   },
                    // ),
                    // const SizedBox(height: 10),
                    // SelectableOption(
                    //   title: 'Social media',
                    //   description: 'Reach customers on Facebook, Instagram, TikTok, and more',
                    //   isSelected: _selections[3],
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selections[3] = value!;
                    //     });
                    //   },
                    // ),
                    // const SizedBox(height: 10),
                    // SelectableOption(
                    //   title: 'Online marketplaces',
                    //   description: 'List products on Etsy, Amazon, and more',
                    //   isSelected: _selections[4],
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selections[4] = value!;
                    //     });
                    //   },
                    // ),
                    const SizedBox(height: 10),
                    SelectableOption(
                      title: 'I\'m not sure',
                      description: '',
                      isSelected: _selections[5],
                      onChanged: (value) {
                        setState(() {
                          _selections[5] = value!;
                        });
                      },
                    ),
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
          MaterialPageRoute(builder: (context) => const ThirdScreen()),
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

class SelectableOption extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const SelectableOption({super.key, 
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
          width: isSelected ? 2 : 1,
        ),
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
      ),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onChanged,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.blue : Colors.black,
                  ),
                ),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
