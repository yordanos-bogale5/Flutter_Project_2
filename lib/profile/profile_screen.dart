// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   Map<String, dynamic> _user = {
//     'name': 'John Doe',
//     'email': 'john.doe@example.com',
//     'phone': '123-456-7890',
//     'address': {
//       'street': '123 Main St',
//       'city': 'Anytown',
//       'state': 'CA',
//       'zipCode': '12345',
//     },
//     'avatarUrl': 'https://via.placeholder.com/150',
//   };

//   File _profileImage;

//   @override
//   void initState() {
//     super.initState();
//     // Fetch user data from an API
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     // Make an API call to fetch user data
//     // and update the _user map accordingly
//   }

//   Future<void> _pickProfileImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         title: const Text('Profile'),
//         backgroundColor: const Color(0xFF4CAF50),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _pickProfileImage,
//               child: Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 60.0,
//                     backgroundImage: _profileImage != null
//                         ? FileImage(_profileImage)
//                         : NetworkImage(_user['avatarUrl']),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Color(0xFF4CAF50),
//                         shape: BoxShape.circle,
//                       ),
//                       padding: const EdgeInsets.all(8.0),
//                       child: const Icon(
//                         Icons.camera_alt,
//                         color: Colors.white,
//                         size: 20.0,       
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             Text(
//               _user['name'],
//               style: const TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF212121),
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               _user['email'],
//               style: const TextStyle(
//                 fontSize: 16.0,
//                 color: Color(0xFF757575),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             const Divider(color: Color(0xFFE0E0E0)),
//             const SizedBox(height: 16.0),
//             ListTile(
//               leading: const Icon(Icons.phone, color: Color(0xFF4CAF50)),
//               title: Text(_user['phone']),
//             ),
//             ListTile(
//               leading: const Icon(Icons.location_on, color: Color(0xFF4CAF50)),
//               title: Text(
//                 '${_user['address']['street']}, '
//                 '${_user['address']['city']}, '
//                 '${_user['address']['state']} '
//                 '${_user['address']['zipCode']}',
//               ),
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the edit profile screen
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: const Color(0xFF4CAF50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
//               ),
//               child: const Text(
//                 'Edit Profile',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }