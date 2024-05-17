import 'dart:async';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:virtual_shop/pages/shop_openning/second.dart';
import 'package:virtual_shop/widget/items_widget.dart';



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
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
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
                    MaterialPageRoute(builder: (context) =>  SecondScreen ()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right:15.0),
                  child: Image.asset(
                    'assets/photo_2024-05-17_01-55-14.jpg',
                    width: 80.0,
                    height: 100.0,
                  ),
                ),
              ),
            

              ],
            ),
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: const Text('Item 1'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: const Text('Item 2'),
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
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
                    'https://th.bing.com/th/id/OIP.OLA6sjsJrIMpDiL8CXoGnwHaDX?rs=1&pid=ImgDetMain',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://static.vecteezy.com/system/resources/previews/004/604/785/original/online-shopping-on-website-and-mobile-application-concept-digital-marketing-shop-and-store-via-smartphone-vector.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 270),
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
          Icon(Icons.home, size: 30),
          Icon(Icons.shop, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          // Handle navigation based on index
        },
      ),
    );
  }
}
