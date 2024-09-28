import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk SplashScreen selama 3 detik
    Timer(const Duration(seconds: 3), () {
      // Navigasi ke halaman login
      Navigator.of(context).pushReplacementNamed('/loginscreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/google_logo.png'),  // Path gambar splash screen
      ),
    );
  }
}