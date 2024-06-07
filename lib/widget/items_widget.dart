import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:virtual_shop/pages/rack.dart';
import 'package:virtual_shop/pages/shop_openning/my_shop/my_shop.dart';

class ItemsWidget extends StatelessWidget {
   const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _buildCard(
            context,
            shopName: 'Dave Gallery',
            images: [
              const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR77d6RAtc-_h-e4o8e15asvCek2kqABsHTIA&usqp=CAU'),
            ],
            texts: ['Paintings'],
          ),
          _buildCard(
            context,
            shopName: 'Gadget World',
            images: [
              const NetworkImage('https://www.zebra.com/content/dam/zebra_dam/global/zcom-web-production/web-production-photography/product-cards/series/et5x-series-3x2-3600.jpg.imgo.jpg'),
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
            ],
            texts: ['Tablet', 'Laptop'],
          ),
          _buildCard(
            context,
            shopName: 'Phina\'s Haven',
            images: [
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
            ],
            texts: ['Monitor', 'Mouse', 'Charger'],
          ),
          _buildCard(
            context,
            shopName: 'Digital Hub',
            images: [
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
              const NetworkImage('https://i5.walmartimages.com/seo/HP-Stream-14-Laptop-Intel-Celeron-N4000-4GB-SDRAM-32GB-eMMC-Office-365-1-yr-Royal-Blue_4f941fe6-0cf3-42af-a06c-7532138492fc_2.cb8e85270e731cb1ef85d431e49f0bf2.jpeg'),
            ],
            texts: ['TV', 'Console', 'Smartwatch', 'Drone'],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required String shopName, required List<ImageProvider> images, required List<String> texts}) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetails screen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyShopPage()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Set card width relative to screen size
        decoration: BoxDecoration(
          color: Colors.white, // Set background color of container and card
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
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              shopName,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white, // Set background color of card
              elevation: 0, // Set elevation to 0 to match container's shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < images.length; i += 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(child: _buildImageAndText(images[i], texts[i])),
                        if (i + 1 < images.length) Flexible(child: _buildImageAndText(images[i + 1], texts[i + 1])),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndText(ImageProvider image, String text) {
    return Column(
      children: [
        Image(image: image, width: 80, height: 80),
        const SizedBox(height: 8),
        Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
