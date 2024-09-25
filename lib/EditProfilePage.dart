import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController(text: "Wira Sukma Saputra");
  final TextEditingController emailController = TextEditingController(text: "wiralodrasaputra07@gmail.com");
  final TextEditingController usernameController = TextEditingController(text: "@wiralodrasaputra");
  final TextEditingController passwordController = TextEditingController(text: "************");
  final TextEditingController phoneController = TextEditingController(text: "+62 812 1919 5308");

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Edit Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Save profile logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/github.png'), // Replace with actual image URL
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, size: 15),
                      onPressed: () {
                        // Action to update the profile picture
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildTextField("Name", nameController),
            const SizedBox(height: 10),
            buildTextField("Email address", emailController),
            const SizedBox(height: 10),
            buildTextField("User name", usernameController),
            const SizedBox(height: 10),
            buildPasswordField(),
            const SizedBox(height: 10),
            buildTextField("Phone number", phoneController),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Rounded shape added here
        ),
        filled: true,
        fillColor: Colors.grey[100], // Light background to make fields stand out
      ),
    );
  }

  Widget buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Rounded shape for password field
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        ),
        filled: true,
        fillColor: Colors.grey[100], // Light background for the password field
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EditProfilePage(),
  ));
}
