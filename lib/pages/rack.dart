import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_shop/pages/3d_view/items_detail.dart';

class MyShopPage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Laptop', imageUrl: 'https://th.bing.com/th/id/R.b052a54c3e9a0ad39d978d97352d7395?rik=EO%2fm%2fBWuo%2bhC6A&pid=ImgRaw&r=0', rating: 4, price: '20,000 birr'),
    Item(name: 'Speakers', imageUrl: 'https://th.bing.com/th/id/R.133fca7e06ef86a208148a59d31826be?rik=XM0Qjbp9XGqPiw&riu=http%3a%2f%2fecx.images-amazon.com%2fimages%2fI%2f71vopzdh-lL.jpg&ehk=jzd6YwwNvHyQaZiTnE9Y0JLQvKD49N4Ei3NOZCUxFp0%3d&risl=&pid=ImgRaw&r=0', rating: 5, price: '1,000 birr'),
    Item(name: 'Computer Mouse', imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/61QXVSF6bLL._AC_SL1500_.jpg', rating: 3, price: '300 birr'),
    Item(name: 'Smart Phones', imageUrl: 'https://th.bing.com/th/id/OIP.0ygH3dSZfDVlmjM0w01LUgHaF-?rs=1&pid=ImgDetMain', rating: 2, price: '15,000 birr'),
    Item(name: 'Tablets', imageUrl: 'https://th.bing.com/th/id/OIP.8ZkINuqqUXtmt2VjT31ciAHaE7?rs=1&pid=ImgDetMain', rating: 4, price: '70,000 birr'),
    Item(name: 'AirPods', imageUrl: 'https://th.bing.com/th/id/R.bb489a6e65a2260deb24e177c73f9b4c?rik=BVZRbE%2bJmCrRHQ&pid=ImgRaw&r=0', rating: 5, price: '2000 birr'),
    Item(name: 'Headsets', imageUrl: 'https://th.bing.com/th/id/OIP.S7ZRKpkX9pUJl5rQE29znAHaHa?rs=1&pid=ImgDetMain', rating: 3, price: '\$28'),
    Item(name: 'Charger', imageUrl: 'https://th.bing.com/th/id/R.8169b239ea5086726c8732c233fae22f?rik=07dRnt5txXRCzA&pid=ImgRaw&r=0', rating: 4, price: '1400 birr'),
    Item(name: 'Hard Disk', imageUrl: 'https://th.bing.com/th/id/R.69012a5fe766ea578231a37646d6e371?rik=FM9qZ1NP0QJFfg&pid=ImgRaw&r=0', rating: 3, price: '170 birr'),
    Item(name: 'Earphones', imageUrl: 'https://th.bing.com/th/id/OIP.EqAI5CmJ-pHOUTWOxFYhNAHaHa?rs=1&pid=ImgDetMain', rating: 5, price: '350 birr'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
  preferredSize: const Size.fromHeight(70.0),
  child: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: const Padding(
      padding: EdgeInsets.only(right:200.0),
      child: Text(
        'Shop',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    flexibleSpace: Image.network(
      'https://t3.ftcdn.net/jpg/01/17/33/22/360_F_117332203_ekwDZkViF6M3itApEFRIH4844XjJ7zEb.jpg', // Replace with your image URL
      fit: BoxFit.cover,
    ),
    centerTitle: true,
  ),
),

        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 15,
              bottom: 30,
              child: Rack(items: items),
            ),
            Positioned(
              top: 10,
              right: 10,
              bottom: 30,
              child: Rack(items: items),
            ),
            // Positioned(
            //   top: 420,
            //   left: 20,
            //   child: Rack(items: items),
            // ),
            // Positioned(
            //   top: 420,
            //   right: 20,
            //   child: Rack(items: items),
            // ),
          ],
        ),
      ),
    );
  }
}

class Rack extends StatelessWidget {
  final List<Item> items;

  Rack({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white, // Set background color of container and card
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailsScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    items[index].imageUrl,
                    height: 145,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    items[index].name,
                    style: GoogleFonts.montserrat(),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      items[index].rating,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.amber[900],
                        size: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    items[index].price,
                    style: GoogleFonts.montserrat(),
                  ),
                ],
              ),
              
            ),
          );
        },
      ),
      
    );
  }
}

class Item {
  final String name;
  final String imageUrl;
  final int rating; // Change rating to an integer representing the number of stars
  final String price;

  Item({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.price,
  });
}
