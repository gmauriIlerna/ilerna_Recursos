import 'package:flutter/material.dart';
import 'package:tarjeta_alumno_sqflite/profile_database.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController _nameController = TextEditingController();

  String _favoriteColor = "Rojo";
  bool _isAppliedStudent = false;
  String _name = "";

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final data = await ProfileDatabase.instance.getProfile();

    if (data != null) {
      setState(() {
        _nameController.text = data["nombre"] ?? "";
        _name = data["nombre"] ?? "";
        _favoriteColor = data["color"] ?? "Rojo";
        _isAppliedStudent = (data["aplicado"] ?? 0) == 1;
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos cargados')),
    );
  }

  Future<void> _saveProfile() async {
    await ProfileDatabase.instance.saveProfile(
      nombre: _nameController.text,
      color: _favoriteColor,
      aplicado: _isAppliedStudent,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perfil guardado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 20),

            DropdownButton<String>(
              value: _favoriteColor,
              items: const [
                DropdownMenuItem(value: 'Rojo', child: Text('Rojo')),
                DropdownMenuItem(value: 'Verde', child: Text('Verde')),
                DropdownMenuItem(value: 'Azul', child: Text('Azul')),
                DropdownMenuItem(value: 'Amarillo', child: Text('Amarillo')),
              ],
              onChanged: (value) {
                setState(() {
                  _favoriteColor = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text('Modo Estudiante Aplicado'),
              value: _isAppliedStudent,
              onChanged: (value) {
                setState(() {
                  _isAppliedStudent = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    child: const Text('Guardar perfil'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _loadProfile,
                    child: const Text('Cargar datos'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nombre: $_name'),
                    Text('Color favorito: $_favoriteColor'),
                    Text('Modo Estudiante Aplicado: ${_isAppliedStudent ? 'Activado' : 'Desactivado'}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}