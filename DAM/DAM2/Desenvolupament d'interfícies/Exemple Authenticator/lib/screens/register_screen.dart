import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService authService = AuthService();
  final FirestoreService firestoreService = FirestoreService();

  String? errorMessage;

  Future<void> register() async {
    try {
      final userCredential = await authService.register(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      final uid = userCredential.user!.uid;

      await firestoreService.createUser(
        uid: uid,
        name: nameController.text.trim(),
        age: int.parse(ageController.text),
        email: emailController.text.trim(),
      );

      if (mounted) Navigator.pop(context);
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: Center(
        child: SizedBox(
          width: 350,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nombre"),
              ),

              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: "Edad"),
              ),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),

              const SizedBox(height: 10),

              if (errorMessage != null)
                Text(errorMessage!, style: const TextStyle(color: Colors.red)),

              ElevatedButton(
                onPressed: register,
                child: const Text("Registrarse"),
              )
            ],
          ),
        ),
      ),
    );
  }
}