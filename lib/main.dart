import 'package:edukids/dashboard.dart';
import 'package:edukids/register.dart';
import 'package:edukids/splash_screen.dart';
import 'package:edukids/loginscreen.dart';  // Mengimpor LoginScreen yang sudah ada
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';  // Mengimpor Firebase Core
import 'firebase_options.dart';  // File konfigurasi Firebase yang dihasilkan

void main() async {
  // Inisialisasi Firebase sebelum menjalankan aplikasi
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: const SplashScreen(),  // Halaman Splash Screen sebagai home
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),  // Tambahkan rute untuk RegisterScreen
        '/home': (context) => const Dashboard(),  // Tambahkan rute untuk halaman utama
      },
    );
  }
}
