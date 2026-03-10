import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final firestoreService = FirestoreService();

    final user = authService.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: firestoreService.getUser(user.uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data();

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nombre: ${data?["name"]}"),
                Text("Edad: ${data?["age"]}"),
                Text("Email: ${data?["email"]}"),
              ],
            ),
          );
        },
      ),
    );
  }
}