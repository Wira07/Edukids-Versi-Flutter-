import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _currentIndex = 0; // Start with a valid index for BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A0DAD),
        elevation: 0,
        title: const Column(
          children: [
            // Top Section Title
            Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
            decoration: const BoxDecoration(
              color: Color(0xFF6A0DAD),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  'Wira Sukma Saputra',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'West Java, Indonesia',
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'A junior UX UI designer and a college student',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Tabs Section with horizontal scrolling
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTab("Account", isSelected: true),
                  _buildTab("Privacy & Security"),
                  _buildTab("Support"),
                ],
              ),
            ),
          ),
          // Settings Options Section
          Expanded(
            child: ListView(
              children: [
                _buildSettingsOption(context, Icons.person, "Profile"),
                _buildSettingsOption(context, Icons.chat, "Chats"),
                _buildSettingsOption(context, Icons.notifications, "Notification"),
                _buildSettingsOption(context, Icons.settings, "Preferences"),
                _buildSettingsOption(context, Icons.link, "Invite Link"),
                _buildSettingsOption(context, Icons.dark_mode, "Dark Mode",
                    trailing: Switch(value: false, onChanged: (val) {})),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.add, color: Colors.purple),
                  title: Text("Add Account",
                      style: GoogleFonts.poppins(
                          color: Colors.purple,
                          fontWeight: FontWeight.w500)),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: Text("Logout Wira Sukma Saputra",
                      style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontWeight: FontWeight.w500)),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
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

  // Function to Build Tabs
// Function to Build Tabs
  Widget _buildTab(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12), // Padding sesuai contoh
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF6A0DAD) : Colors.grey.shade300, // Warna sesuai gambar
        borderRadius: BorderRadius.circular(20), // Membuat rounded sesuai gambar
        boxShadow: isSelected
            ? [const BoxShadow(color: Colors.black26, blurRadius: 4, spreadRadius: 1)] // Shadow untuk tab terpilih
            : [],
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: isSelected ? Colors.white : Colors.grey.shade600, // Text color sesuai kondisi
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  // Function to Build Settings Options
  Widget _buildSettingsOption(BuildContext context, IconData icon, String title, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
