import 'package:flutter/material.dart';
import 'package:virtual_shop/pages/3d_view/options.dart';



class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image from network
            Expanded(
              flex: 1,
              child: Image.network(
                'https://2.bp.blogspot.com/-t1JFZziJ1Ds/WknqOuPShhI/AAAAAAAAAns/Syqa5VtQfo4fJnKQxaNXEGAMgHLetOaVQCLcBGAs/s400/10748015.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            // Product details
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HP 14 Laptop, Intel Celeron N4020, 4 GB RAM, 64 GB Storage, 14-inch Micro-edge HD Display, Windows 11 Home, Thin & Portable, 4K Graphics, One Year of Microsoft 365 (14-dq0040nr, Snowflake White)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Options:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '7 capacities (link)',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(
                        '3.9 out of 5 stars',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '2K+ bought in past month',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'No featured offers available',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '\$127.00 (83 used & new offers)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewOption ()),
    );
  },
  child: Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set background color of container
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'See options',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
