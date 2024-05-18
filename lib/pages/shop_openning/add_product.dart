import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
 // bool _chargeTax = false;
  bool _trackQuantity = false;
  bool _continueSelling = false;
  bool _physicalProduct = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Short sleeve t-shirt',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Rich text editor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Media',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle file upload
              },
              child: const Text('Upload files'),
            ),
            const Text('No file chosen'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Upload New
                  },
                  child: const Text('Upload new'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle Select Existing
                  },
                  child: const Text('Select existing'),
                ),
              ],
            ),
            const Text('Accepts images, videos, or 3D models'),
            const SizedBox(height: 20),
            const Text(
              'Pricing',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Price',
                prefixText: 'ETB ',
              ),
              keyboardType: TextInputType.number,
            ),
            // const TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Compare-at price',
            //     prefixText: 'ETB ',
            //   ),
            //   keyboardType: TextInputType.number,
            // ),
            // CheckboxListTile(
            //   title: const Text('Charge tax on this product'),
            //   value: _chargeTax,
            //   onChanged: (bool? value) {
            //     setState(() {
            //       _chargeTax = value!;
            //     });
            //   },
            // ),
            // const TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Cost per item',
            //     prefixText: 'ETB ',
            //   ),
            //   keyboardType: TextInputType.number,
            // ),
            // const Text('Profit --'),
            // const Text('Margin --'),
            // const SizedBox(height: 20),
            // const Text(
            //   'Inventory',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            CheckboxListTile(
              title: const Text('Track quantity'),
              value: _trackQuantity,
              onChanged: (bool? value) {
                setState(() {
                  _trackQuantity = value!;
                });
              },
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
              keyboardType: TextInputType.number,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Shop location',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Shop location quantity available',
              ),
              keyboardType: TextInputType.number,
            ),
            CheckboxListTile(
              title: const Text('Continue selling when out of stock'),
              value: _continueSelling,
              onChanged: (bool? value) {
                setState(() {
                  _continueSelling = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Shipping',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('This is a physical product'),
              value: _physicalProduct,
              onChanged: (bool? value) {
                setState(() {
                  _physicalProduct = value!;
                });
              },
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Weight',
                suffixText: 'kg',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Submit button press
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
