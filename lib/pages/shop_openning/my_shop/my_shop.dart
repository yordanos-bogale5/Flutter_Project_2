import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_shop/pages/rack.dart';

import 'item.dart';


class MyShopPage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Laptop',
      imageUrl: 'https://th.bing.com/th/id/R.b052a54c3e9a0ad39d978d97352d7395?rik=EO%2fm%2fBWuo%2bhC6A&pid=ImgRaw&r=0',
      rating: 4,
      price: '20,000 birr',
      modelPath: 'assets/pc.glb',
    ),
    Item(
      name: 'Speakers',
      imageUrl: 'https://th.bing.com/th/id/R.133fca7e06ef86a208148a59d31826be?rik=XM0Qjbp9XGqPiw&riu=http%3a%2f%2fecx.images-amazon.com%2fimages%2fI%2f71vopzdh-lL.jpg&ehk=jzd6YwwNvHyQaZiTnE9Y0JLQvKD49N4Ei3NOZCUxFp0%3d&risl=&pid=ImgRaw&r=0',
      rating: 5,
      price: '1,000 birr',
      modelPath: 'assets/speaker.glb',
    ),
    Item(
      name: 'Tv',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3dCVaTGTCjthgeACNBn8LxS42K3j1GYt8xQ&s',
      rating: 3,
      price: '30000 birr',
      modelPath: 'assets/tv.glb',
    ),
    Item(
      name: 'Smart Phones',
      imageUrl: 'https://th.bing.com/th/id/OIP.0ygH3dSZfDVlmjM0w01LUgHaF-?rs=1&pid=ImgDetMain',
      rating: 2,
      price: '15,000 birr',
      modelPath: 'assets/mobile.glb',
    ),
    Item(
      name: 'Tablets',
      imageUrl: 'https://th.bing.com/th/id/OIP.8ZkINuqqUXtmt2VjT31ciAHaE7?rs=1&pid=ImgDetMain',
      rating: 4,
      price: '17,000 birr',
      modelPath: 'assets/tablet.glb',
    ),
    // Add other items similarly
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
              padding: EdgeInsets.only(right: 200.0),
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
              'https://t3.ftcdn.net/jpg/01/17/33/22/360_F_117332203_ekwDZkViF6M3itApEFRIH4844XjJ7zEb.jpg',
              fit: BoxFit.cover,
            ),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Rack(item: items[index], items: [],);
            },
          ),
        ),
      ),
    );
  }
}
