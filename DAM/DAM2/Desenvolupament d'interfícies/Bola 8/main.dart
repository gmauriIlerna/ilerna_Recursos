import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MagicBallApp());
}

class MagicBallApp extends StatelessWidget {
  const MagicBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Bola 8 del Destino',
      theme: ThemeData.dark(),
      home: const MagicBallPage(),
    );
  }
}

class MagicBallController {
  final TextEditingController questionController = TextEditingController();

  final List<String> respuestas = [
    "Sí",
    "No",
    "Tal vez",
    "Pregunta de nuevo",
    "Definitivamente sí",
    "Definitivamente no",
    "No cuentes con ello",
    "Parece probable"
  ];

  String obtenerRespuesta() {
    final texto = questionController.text.trim();
    if (texto.isEmpty) {
      return "Haz una pregunta primero";
    }
    final random = Random();
    return respuestas[random.nextInt(respuestas.length)];
  }
}

class MagicBallPage extends StatelessWidget {
  const MagicBallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MagicBallController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0A23), Color(0xFF1C1C3C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "La Bola 8 del Destino",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Campo de texto
            TextField(
              controller: controller.questionController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Escribe tu pregunta aquí...",
                fillColor: Colors.white12,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Aquí está el componente que gestiona estado y animación
            MagicBallAnswer(controller: controller),
          ],
        ),
      ),
    );
  }
}

class MagicBallAnswer extends StatefulWidget {
  final MagicBallController controller;

  const MagicBallAnswer({super.key, required this.controller});

  @override
  State<MagicBallAnswer> createState() => _MagicBallAnswerState();
}

class _MagicBallAnswerState extends State<MagicBallAnswer> {
  String respuesta = "";
  bool visible = false;

  void consultar() {
    setState(() {
      visible = false;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      respuesta = widget.controller.obtenerRespuesta();
      setState(() => visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: consultar,
          child: const Text("Consultar"),
        ),
        const SizedBox(height: 30),

        // Bola 8
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: const Center(
            child: Text(
              "8",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 30),

        AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Text(
            respuesta,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
