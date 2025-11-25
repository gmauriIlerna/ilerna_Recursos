import 'package:flutter/material.dart';

void main() {
  runApp(const MiniCalculator());
}

class MiniCalculator extends StatelessWidget {
  const MiniCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Calculadora',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Mini Calculadora')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Pantalla de resultados
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: const Text(
                '0',
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),

            const Divider(color: Colors.grey),

            // Fila 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('7')),
                ElevatedButton(onPressed: () {}, child: const Text('8')),
                ElevatedButton(onPressed: () {}, child: const Text('9')),
                ElevatedButton(onPressed: () {}, child: const Text('+')),
              ],
            ),

            // Fila 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('4')),
                ElevatedButton(onPressed: () {}, child: const Text('5')),
                ElevatedButton(onPressed: () {}, child: const Text('6')),
                ElevatedButton(onPressed: () {}, child: const Text('-')),
              ],
            ),

            // Fila 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('1')),
                ElevatedButton(onPressed: () {}, child: const Text('2')),
                ElevatedButton(onPressed: () {}, child: const Text('3')),
                ElevatedButton(onPressed: () {}, child: const Text('*')),
              ],
            ),

            // Fila 4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('0')),
                ElevatedButton(onPressed: () {}, child: const Text('C')),
                ElevatedButton(onPressed: () {}, child: const Text('=')),
                ElevatedButton(onPressed: () {}, child: const Text('/')),
              ],
            ),

            // Tope final pantalla
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}