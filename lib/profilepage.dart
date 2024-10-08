import 'dart:io';
import 'package:edukids/EditProfilePage.dart';
import 'package:edukids/LanguagePage.dart';
import 'package:edukids/SettingsScreen.dart';
import 'package:edukids/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Tambahkan ini untuk memilih gambar

void main() {
  runApp(const MaterialApp(home: Dashboard())); // Run the Dashboard initially
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; // To track selected item in BottomNavigationBar
  File? _image;
  String? imageUrl;

  final User? user = FirebaseAuth.instance.currentUser; // Mendapatkan pengguna saat ini

  Future<void> _uploadImage() async {
    if (_image == null) return;

    try {
      // Upload gambar ke Firebase Storage
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${user!.uid}.jpg');

      await ref.putFile(_image!);

      // Dapatkan URL dari gambar yang diupload
      String downloadUrl = await ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });

      // Anda dapat menyimpan downloadUrl ke Firestore jika ingin
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      // Upload gambar setelah dipilih
      _uploadImage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      // Index for ProfilePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage(imageUrl: imageUrl)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'TCourse',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          )
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open Drawer
            },
          ),
        ),
      ),
      // Drawer and other widgets omitted for brevity...
      body: const Center(child: Text("Main content goes here")), // Body content placeholder
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Track selected item
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped, // Add tap logic
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile icon
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String? imageUrl; // Tambahkan parameter imageUrl di sini

  const ProfilePage({super.key, this.imageUrl}); // Constructor dengan imageUrl


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Perbaikan, method _pickImage perlu di-refactor
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: imageUrl != null
                          ? NetworkImage(imageUrl!) // Menampilkan gambar dari Firebase
                          : const AssetImage('assets/profile.png') as ImageProvider,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Wira Sukma Saputra',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'wiralodrasaputra@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Action when "View 4 Active Transactions" is tapped
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.receipt_long, color: Colors.red),
                              SizedBox(width: 10),
                              Text(
                                'View 4 Active Transactions',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.red),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, color: Colors.grey),

            // Menu section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.edit,
                    text: "Edit Profile",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.card_giftcard,
                    text: "Discount Voucher",
                    onTap: () {
                      // Action for Discount Voucher
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.support_agent,
                    text: "Support",
                    onTap: () {
                      // Action for Support
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings,
                    text: "Settings",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsScreen()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.location_city,
                    text: "Location",
                    onTap: () {
                      // Action for Location
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.language,
                    text: "Language",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LanguagePage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    text: "Log Out",
                    textColor: Colors.red,
                    iconColor: Colors.red,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: BottomNavigationBar(
          currentIndex: 3, // Set index to Profile
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            Navigator.pop(context); // Return to the previous screen
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Course',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for profile menu item
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final Color iconColor;

  const ProfileMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: iconColor),
          ],
        ),
      ),
    );
  }
}
