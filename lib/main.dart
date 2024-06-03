import 'package:flutter/material.dart';
import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:virtual_shop/pages/home.dart';

void main() {
  // Setup Chapa
  Chapa.configure(privateKey: "CHASECK_TEST-0zTPIQ2wFsVRrogvJ4Lc1oTPsImdJ26o");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}