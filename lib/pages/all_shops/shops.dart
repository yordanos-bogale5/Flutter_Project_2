import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<String> recentlySearched = [
    'Flutter',
    'Dart',
    'Mobile Development',
    'State Management',
    'Animations',
    'Widgets',
    'Material Design'
  ];

  final List<String> categories = [
    'Electronics',
    'Clothing',
    'Home & Kitchen',
    'Beauty & Health',
    'Sports',
    'Toys',
    'Automotive'
  ];

  final List<String> shopCategories = [
    'Phones',
    'Laptops',
    'Clothes',
    'Shoes',
    'Books',
    'Accessories',
    'Furniture',
    'Cosmetics',
    'Toys',
    'Jewelry'
  ];

  final List<String> imageUrls = [
    'https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg',
    'https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg',
    'https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'
  ];

  final List<String> smallTexts = List.generate(15, (index) => 'Text ${index + 1}');

  int currentIndex = 0;
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    startSliding();
  }

  void startSliding() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 1) % recentlySearched.length;
        });
        startSliding();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.grey),
                      alignment: Alignment.center,
                      iconSize: 18,
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Center(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            height: 50,
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                          items: recentlySearched.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Center(
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedCategoryIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color.fromRGBO(238, 238, 238, 1),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Just For You'),
                Text('Picks for You'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.grey[300],
                    child: ListView.builder(
                      itemCount: shopCategories.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(shopCategories[index]),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(smallTexts.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrls[index % imageUrls.length]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  smallTexts[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
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
