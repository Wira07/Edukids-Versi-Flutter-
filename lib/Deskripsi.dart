import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Deskripsi(),
    );
  }
}

class Deskripsi extends StatelessWidget {
  const Deskripsi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Top image banner
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage('assets/fullstack.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Back button
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const Dashboard()), // Ganti dengan kelas Dashboard Anda
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Title
                  const Text(
                    'Basic UI/UX Design',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // Instructor Avatar
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/fullstack.jpeg'),
                      ),
                      const SizedBox(width: 10),
                      // Instructor Name and Profile
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Annelian D Souza',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Graphics & UI Mentor',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Spacer(),
                      // View Profile Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('View Profile'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Course Details: Lessons, Ratings, Students
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCourseDetailCard(Icons.book, '30+', 'Lessons'),
                      _buildCourseDetailCard(Icons.star, '4.5', 'Ratings'),
                      _buildCourseDetailCard(Icons.people, '100+', 'Students'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Course Price
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Enrolled', style: TextStyle(color: Colors.blue)),
                      Text(
                        '\$48',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Course Description
                  const Text(
                    'About Course',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'This UI/UX Design Course is a comprehensive introduction to '
                        'the fundamental principles and concepts of User Interface (UI) '
                        'and User Experience (UX) design. Targeted towards beginners, '
                        'this course provides a solid foundation in understanding the core '
                        'elements that contribute to creating intuitive, user-friendly digital '
                        'experiences.',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to create the cards for course details
  Widget _buildCourseDetailCard(IconData icon, String value, String label) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5), // Tambahkan margin antar card
      child: SizedBox(
        width: 110, // Mengatur lebar tiap card agar lebih lebar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5), // Spasi kecil antara teks dan label
              Text(
                label,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10), // Spasi sebelum ikon
              Icon(icon, color: Colors.blue, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
