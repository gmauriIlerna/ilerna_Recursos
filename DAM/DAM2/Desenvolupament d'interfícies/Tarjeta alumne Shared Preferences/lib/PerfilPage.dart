import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  // Elegí usar TextEditingController para tener control directo sobre el texto
  // y poder actualizarlo fácilmente cuando cargamos datos desde SharedPreferences.
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
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _nameController.text = prefs.getString('nombre') ?? '';
      _name = prefs.getString('nombre') ?? '';
      _favoriteColor = prefs.getString('color') ?? 'Rojo';
      _isAppliedStudent = prefs.getBool('aplicado') ?? false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos cargados')),
    );
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('nombre', _nameController.text);
    await prefs.setString('color', _favoriteColor);
    await prefs.setBool('aplicado', _isAppliedStudent);

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