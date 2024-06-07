// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:virtual_shop/pages/shop_openning/first.dart';
//import 'package:virtual_shop/profile/profile_screen.dart';

import 'package:virtual_shop/widget/items_widget.dart';
import 'all_shops/shops.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPageIndex < 2) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildShopCategory(String imageUrl, String categoryName) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 60,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16.0),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.blue,
                        size: 16.0,
                      ),
                    ),
                    onTap: () {
                      print('Shop Favorited!');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          categoryName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 30,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                    ),
                    onSubmitted: (value) {
                      print('Search query: $value');
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectionScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Set background color of container
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Open shop',
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
        automaticallyImplyLeading:
            false, // This line removes the back button icon
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: [
                  Image.network(
                    'https://static.vecteezy.com/system/resources/previews/000/692/266/original/sale-promotion-banner-template-vector.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://static.vecteezy.com/system/resources/previews/004/604/785/original/online-shopping-on-website-and-mobile-application-concept-digital-marketing-shop-and-store-via-smartphone-vector.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://static.vecteezy.com/system/resources/previews/000/692/266/original/sale-promotion-banner-template-vector.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 260),
              child: Text(
                "Category",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Color(0xFF808080),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildShopCategory(
                      'https://i5.walmartimages.com/asr/af9880b8-702d-4703-99c6-8c9bbbadc03e_1.fedaaa83fff4a4b34a8054ceed7b5c06.jpeg',
                      'Shoes',
                    ),
                    const SizedBox(width: 10),
                    _buildShopCategory(
                      'https://ariftibeb.com/cdn/shop/products/IMG_E9859_480x480.jpg?v=1653200020',
                      'Fashion',
                    ),
                    const SizedBox(width: 10),
                    _buildShopCategory(
                      'https://assets.wfcdn.com/im/44513477/c_crop_resize_zoom-h624-w900%5Ecompr-r85/2433/243397967/default_name.jpg',
                      'Furniture',
                    ),
                    const SizedBox(width: 10),
                    _buildShopCategory(
                      'https://www.classicfootballshirts.co.uk/cdn-cgi/image/fit=pad,q=70,f=webp//pub/media/catalog/product//4/0/4065424487796-1_1.jpg',
                      'Sport Clothes',
                    ),
                    const SizedBox(width: 10),
                    _buildShopCategory(
                      'https://ariftibeb.com/cdn/shop/products/IMG_E9859_480x480.jpg?v=1653200020',
                      'Fashion',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 250),
              child: Text(
                "Top Shops",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Color(0xFF808080),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: ItemsWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home, size: 30),
              Text('Home', style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shop, size: 30),
              Text('All Shops', style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shopping_cart, size: 30),
              Text('Cart', style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, size: 30),
              Text('Profile', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
        onTap: (index) {
          // Handle navigation based on index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopScreen()),
              );
              break;
            case 3:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) =>  ProfileScreen()),
              // );
              break;
          }
        },
      ),
    );
  }
}
