import 'package:edukids/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:edukids/loginscreen.dart';  // Mengimpor LoginScreen yang sudah ada

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduKids',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
      },
    );
  }
}
