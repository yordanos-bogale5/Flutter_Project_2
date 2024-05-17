import 'package:flutter/material.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top:25),
      child: const Row(
        children: [
          Icon(
            Icons.shop,
            size: 30,
            color: Color.fromRGBO(76, 83, 165, 1),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Virtual Shop",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
         
        ],
      ),
    );
  }
}
