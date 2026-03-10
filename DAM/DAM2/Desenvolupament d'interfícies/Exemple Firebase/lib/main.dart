import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
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
      title: 'Demo Firebase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Demo Firebase Firestore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController edadController = TextEditingController();

  Future<void> insertarRegistro() async {
    final String nombre = nombreController.text.trim();
    final String edadTexto = edadController.text.trim();

    if (nombre.isEmpty || edadTexto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introduce nombre y edad')),
      );
      return;
    }

    final int? edad = int.tryParse(edadTexto);

    if (edad == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La edad debe ser un número')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('prueba').add({
        'nombre': nombre,
        'edad': edad,
      });

      nombreController.clear();
      edadController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro insertado correctamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al insertar: $e')),
      );
    }
  }

  @override
  void dispose() {
    nombreController.dispose();
    edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> todosLosRegistrosStream =
    FirebaseFirestore.instance.collection('prueba').snapshots();

    final Stream<QuerySnapshot> mayoresDeEdadStream = FirebaseFirestore.instance
        .collection('prueba')
        .where('edad', isGreaterThan: 18)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: edadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: insertarRegistro,
              child: const Text('Insertar en Firebase'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _buildListaRegistros(
                      titulo: 'Todos los registros',
                      stream: todosLosRegistrosStream,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: _buildListaRegistros(
                      titulo: 'Solo mayores de 18',
                      stream: mayoresDeEdadStream,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListaRegistros({
    required String titulo,
    required Stream<QuerySnapshot> stream,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error al cargar los datos'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final documentos = snapshot.data!.docs;

                if (documentos.isEmpty) {
                  return const Center(
                    child: Text('No hay registros'),
                  );
                }

                return ListView.builder(
                  itemCount: documentos.length,
                  itemBuilder: (context, index) {
                    final datos =
                    documentos[index].data() as Map<String, dynamic>;

                    final String nombre = datos['nombre']?.toString() ?? '';
                    final String edad = datos['edad']?.toString() ?? '';

                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(nombre),
                        subtitle: Text('Edad: $edad'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}