import 'package:edukids/profilepage.dart';
import 'package:flutter/material.dart';
import 'three_page.dart'; // Pastikan mengimpor halaman ThreePage

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; // Untuk melacak item yang dipilih di BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) { // Indeks untuk Course
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThreePage()),
      );
    } else if (index == 3) { // Indeks untuk Profile
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()), // Navigasi ke ProfilePage
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
              Scaffold.of(context).openDrawer(); // Membuka Drawer
            },
          ),
        ),
      ),
      // Tambahkan Drawer di sini
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Header dengan foto profil dan informasi akun
            const UserAccountsDrawerHeader(
              accountName: Text('Wira Sukma Saputra'),
              accountEmail: Text('wiralodrasaputra07@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/ui_ux.jpeg'), // Path gambar profil
              ),
              decoration: BoxDecoration(
                color: Colors.purple, // Warna latar belakang header
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Menutup Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Course'),
              onTap: () {
                Navigator.pop(context); // Menutup Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Saved'),
              onTap: () {
                Navigator.pop(context); // Menutup Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Menutup Drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Try search programming course',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              // Categories
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryIcon(icon: Icons.design_services, label: 'Design'),
                  CategoryIcon(icon: Icons.code, label: 'Code'),
                  CategoryIcon(icon: Icons.business, label: 'Business'),
                  CategoryIcon(icon: Icons.data_usage, label: 'Data'),
                ],
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: "Continue Learning"),
              const SizedBox(height: 10),
              const ContinueLearningCard(
                courseTitle: "UI/UX Design",
                completedLessons: "12/16 Lessons",
                progressPercentage: 0.75,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionTitle(title: "Popular Course"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Colors.purple),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PopularCourseCard(
                      courseTitle: "Create 3D With Blender",
                      lessons: "16 Lessons • 48 Hours",
                      price: "\$400",
                      category: "Design",
                      imagePath: 'assets/ui_ux.jpeg', // Gambar UI/UX Design
                    ),
                    SizedBox(width: 16), // Jarak antar kartu
                    PopularCourseCard(
                      courseTitle: "Full Stack Web Development",
                      lessons: "20 Lessons • 60 Hours",
                      price: "\$350",
                      category: "Code",
                      imagePath: 'assets/fullstack.jpeg', // Gambar Full Stack
                    ),
                    SizedBox(width: 16), // Jarak antar kartu
                    PopularCourseCard(
                      courseTitle: "Data Science Mastery",
                      lessons: "25 Lessons • 80 Hours",
                      price: "\$450",
                      category: "Data",
                      imagePath: 'assets/backend.jpeg', // Gambar Backend
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex, // Melacak item yang dipilih
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped, // Menambahkan logika tap
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

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFF0F0F0),
          child: Icon(icon, size: 30, color: Colors.purple),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class ContinueLearningCard extends StatelessWidget {
  final String courseTitle;
  final String completedLessons;
  final double progressPercentage;

  const ContinueLearningCard({
    super.key,
    required this.courseTitle,
    required this.completedLessons,
    required this.progressPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFF0F0F0),
            radius: 30,
            child: Icon(Icons.design_services, color: Colors.purple, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(completedLessons,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: progressPercentage,
                  color: Colors.purple,
                  backgroundColor: Colors.grey[200],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class PopularCourseCard extends StatelessWidget {
  final String courseTitle;
  final String lessons;
  final String price;
  final String category;
  final String imagePath;

  const PopularCourseCard({
    super.key,
    required this.courseTitle,
    required this.lessons,
    required this.price,
    required this.category,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  lessons,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
