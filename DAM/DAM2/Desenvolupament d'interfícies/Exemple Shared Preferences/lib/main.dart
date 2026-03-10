import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPrefsExample(),
    );
  }
}

class SharedPrefsExample extends StatefulWidget {
  @override
  _SharedPrefsExampleState createState() => _SharedPrefsExampleState();
}

class _SharedPrefsExampleState extends State<SharedPrefsExample> {
  String username = "";
  int counter = 0;

  /// Ejecutar una vez al cargar el widget
  @override
  void initState() {
    super.initState();
    loadData();
  }

  /// Cargar datos de SharedPreferences
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? "Sin nombre";
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  /// Guardar datos en SharedPreferences
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferences Ejemplo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Bienvenido, $username", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "Introduce tu nombre"),
              onChanged: (value) {
                username = value;
              },
            ),
            const SizedBox(height: 20),

            Text("Contador: $counter", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Text("Incrementar"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await saveData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Datos guardados")),
                );
              },
              child: Text("Guardar"),
            ),

            ElevatedButton(
              onPressed: () async {
                await loadData();
              },
              child: Text("Cargar"),
            ),
          ],
        ),
      ),
    );
  }
}