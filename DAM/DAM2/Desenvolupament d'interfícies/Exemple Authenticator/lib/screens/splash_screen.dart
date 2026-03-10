import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/auth_gate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authService = AuthService();

    return Scaffold(
      body: StreamBuilder(
        stream: authService.authStateChanges(),
        builder: (context, snapshot) {

          // Mientras Firebase comprueba la sesión
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.flutter_dash,
                    size: 120,
                    color: Colors.indigo,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Firebase Demo",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  CircularProgressIndicator()
                ],
              ),
            );
          }

          // Cuando Firebase ya sabe el estado
          return const AuthGate();
        },
      ),
    );
  }
}