import 'package:flutter/material.dart';
import 'package:virtual_shop/pages/3d_view/items_detail.dart';
import 'package:virtual_shop/pages/shop_openning/my_shop/item.dart';


class Rack extends StatelessWidget {
  final Item item;

  const Rack({Key? key, required this.item, required List items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              imageUrl: item.imageUrl,
              name: item.name,
              rating: item.rating,
              price: item.price,
              modelPath: item.modelPath,
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.network(item.imageUrl),
          title: Text(item.name),
          subtitle: Text(item.price),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              item.rating,
              (index) => const Icon(Icons.star, color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
