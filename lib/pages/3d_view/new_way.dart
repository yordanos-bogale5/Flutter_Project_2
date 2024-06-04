import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class CreateShopPage extends StatefulWidget {
  @override
  _CreateShopPageState createState() => _CreateShopPageState();
}

class _CreateShopPageState extends State<CreateShopPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSubmitting = false;
  late String _ownerId;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _loadOwnerId();
  }

  Future<void> _loadOwnerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _ownerId = prefs.getString('owner_id') ?? '';
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  Future<void> _addShop(Map<String, dynamic> formData) async {
    if (_ownerId.isEmpty) {
      // Handle owner ID not found
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://localhost:8000/owners/addshop?owner_id=$_ownerId'),
      );

      request.fields['shop_name'] = formData['shop_name'];
      request.fields['shop_category'] = formData['shop_category'];
      if (_selectedImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          _selectedImage!.path,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Created.')),
        );
      } else {
        throw Exception('Failed to create shop');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Creating Shop failed, please try again in a minute')),
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create your shop',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'shop_name',
                  decoration: const InputDecoration(
                    labelText: 'Shop Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(3),
                    FormBuilderValidators.maxLength(100),
                    FormBuilderValidators.match(r'^[a-zA-Z\s]+$'),
                  ]),
                ),
                const SizedBox(height: 20),
                FormBuilderDropdown(
                  name: 'shop_category',
                  decoration: const InputDecoration(
                    labelText: 'Shop Category',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'cosmetics', child: Text('Cosmetics')),
                    DropdownMenuItem(value: 'electronics', child: Text('Electronics')),
                    DropdownMenuItem(value: 'shoe', child: Text('Shoes/Clothes')),
                  ],
                ),
                const SizedBox(height: 20),
                FormBuilderField<File>(
                  name: 'file',
                  builder: (FormFieldState<File?> field) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Shop Image',
                        border: OutlineInputBorder(),
                      ),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: _pickFile,
                            child: const Text('Select Image'),
                          ),
                          if (_selectedImage != null)
                            Image.file(_selectedImage!),
                          if (field.errorText != null)
                            Text(
                              field.errorText ?? '',
                              style: const TextStyle(color: Colors.red),
                            ),
                        ],
                      ),
                    );
                  },
                  validator: (value) {
                    if (_selectedImage == null) {
                      return 'Please select an image';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isSubmitting
                      ? null
                      : () {
                          if (_formKey.currentState?.saveAndValidate() ?? false) {
                            _addShop(_formKey.currentState?.value ?? {});
                          }
                        },
                  child: _isSubmitting
                      ? const CircularProgressIndicator()
                      : const Text('Create my Shop'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
