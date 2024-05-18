import 'package:flutter/material.dart';

import 'add_product.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Shop Owner Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
              const Divider(),
            ListTile(
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
              const Divider(),
            ListTile(
              title: const Text('Customers'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
              const Divider(),
            ListTile(
              title: const Text('Category'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
              const Divider(),
            ListTile(
              title: const Text('Discounts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
              const Divider(),
            // ListTile(
            //   title: const Text('Sales channels'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Online Store'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
              const Divider(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Home. This page is ready',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select a plan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Get ready to sell',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Here’s a guide to get started. As your business grows, you’ll get fresh tips and insights here.',
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Setup guide',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Use this personalized guide to get your store up and running.',
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.0, // Update this value based on progress
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  const Text('0 / 3 completed'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add your first product',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Write a description, add photos, and set pricing for the products you plan to sell.',
                  ),
                  const SizedBox(height: 10),
                ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );
  },
  child: const Text('Add Product'),
),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set your shipping rates',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Add additional content here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
