import 'package:edukids/dashboard.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white, // Background putih sesuai gambar
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0), // Atur jarak dari atas
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/TCourse.jpg', // Sesuaikan path gambar logo kamu
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Wecare",
                    style: TextStyle(
                      fontSize: 22, // Perkecil ukuran teks
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Warna teks hijau sesuai gambar
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height *
                  0.7, // Menyesuaikan tinggi container
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Buat konten di tengah
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Register for free',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks hitam
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                suffixIcon: const Icon(Icons.visibility),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Checkbox(
                                  value: true, // Sesuaikan jika diperlukan
                                  onChanged: (bool? value) {},
                                  activeColor: Colors.green,
                                ),
                                const Text('Remember me'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Warna tombol hijau
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Sesuaikan radius
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white), // Warna teks putih
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('or continue with'),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/facebook.png'),
                          // Logo Facebook
                          iconSize: 40,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset('assets/google.png'), // Logo Google
                          iconSize: 40,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset('assets/github.png'), // Logo GitHub
                          iconSize: 40,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
