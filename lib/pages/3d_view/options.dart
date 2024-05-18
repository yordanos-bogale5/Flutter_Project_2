import 'package:flutter/material.dart';
import 'package:virtual_shop/pages/3d_view/3d_screen.dart';

class ViewOption extends StatelessWidget {
  const ViewOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HP 14 Laptop, Intel Celeron N4020, 4 GB RAM, 64 GB Storage, 14-inch Micro-edge HD Display, Windows 11 Home, Thin & Portable, 4K Graphics, One Year of Microsoft 365 (14-dq0040nr, Snowflake White)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text(
                  '3.9',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  ' 1,350',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Text(
              'HP 14 Laptop Description...',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network('https://th.bing.com/th/id/R.196920a00ae01fd85ecca3135fa6ee22?rik=DiPAW76Ps1GUgw&pid=ImgRaw&r=0'),
                  Image.network('https://cdn.mos.cms.futurecdn.net/gBeu6qgL4pc8K7HEjw4Kok.jpg'),
                  Image.network('https://microless.com/cdn/products/6da67d70a7dfb260ce8e47a3b14e05db-hi.jpg'),
                  // Add more images here as needed
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThreeDScreen(title: '',)),
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
          'VIEW IN 3D',
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
          ],
        ),
      ),
    );
  }
}
