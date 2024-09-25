import 'package:flutter/material.dart';

import 'dashboard.dart'; // Mengimpor dashboard.dart

void main() {
  runApp(const ThreePage());
}

class ThreePage extends StatelessWidget {
  const ThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseDetailScreen(),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Dashboard()), // Ganti dengan kelas Dashboard Anda
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Kursus
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/fullstack.jpeg', // Ganti dengan gambar Anda
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Informasi Mentor
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/TCourse.jpg'), // Ganti dengan gambar mentor
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wira Sukma Saputra',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('Mobile Developer | Freelancer',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text('4.9',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Tab untuk Course dan Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text('Course (25)',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text('Description',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Daftar Pelajaran
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  LessonTile('Introduction', '20 min', true),
                  LessonTile('Mastering Tools', '1 hour 20 min', false),
                  LessonTile('Create Simple Shapes', '45 min', false),
                  // Tambahkan lesson lain jika diperlukan
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // Tombol Daftar di Bawah
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Dashboard()), // Mengarahkan ke Dashboard
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6C63FF),
            // Warna ungu sesuai gambar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text('Enroll Course - \$300',
              style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  final String title;
  final String duration;
  final bool isCompleted;

  const LessonTile(this.title, this.duration, this.isCompleted, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          Icons.play_circle_fill,
          color: isCompleted ? Colors.green : Colors.orange,
          size: 30,
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(duration),
        trailing: isCompleted
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.lock, color: Colors.grey),
      ),
    );
  }
}
