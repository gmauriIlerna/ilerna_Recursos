import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorSquaresListView(),
    );
  }
}

class ColorSquaresListView extends StatefulWidget {
  @override
  State<ColorSquaresListView> createState() => _ColorSquaresListViewState();
}

class _ColorSquaresListViewState extends State<ColorSquaresListView> {
  final List<Color> _colors = [];
  final Random _random = Random();

  Color _randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  void _addSquare() {
    setState(() {
      _colors.add(_randomColor());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Color List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _colors.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  width: 60,
                  height: 60,
                  color: _colors[index],
                  child: Text(index.toString()),
                );
              },
            ),
          ),

          // 👇 Text always visible
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "⬆ Scroll the list above ⬆",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSquare,
        child: Icon(Icons.add),
      ),
    );
  }
}