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
        body: const CalculatorBody(), // 👈 Aquí comienza el StatefulWidget
      ),
    );
  }
}

class CalculatorBody extends StatefulWidget {
  const CalculatorBody({super.key});

  @override
  State<CalculatorBody> createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  String display = "0"; // Valor mostrado en pantalla
  double? num1; // Primer número
  double? num2; // Segundo número
  String? operador; // Operador seleccionado

  void onNumberPressed(String number) {
    setState(() {
      if (display == "0" || "+-*/".contains(display)) {
        display = number;
      } else {
        display += number;
      }
    });
  }

  void onOperatorPressed(String op) {
    setState(() {
      if(!"+-*/".contains(display)) {
        num1 = double.tryParse(display);
        operador = op;
        display = op;
      } else {
        operador = op;
        display = op;
      }
    });
  }

  void onClearPressed() {
    setState(() {
      display = "0";
      num1 = null;
      num2 = null;
      operador = null;
    });
  }

  void onEqualsPressed() {
    setState(() {
      num2 = double.tryParse(display);
      if (num1 != null && num2 != null && operador != null) {
        switch (operador) {
          case '+':
            display = (num1! + num2!).toString();
            break;
          case '-':
            display = (num1! - num2!).toString();
            break;
          case '*':
            display = (num1! * num2!).toString();
            break;
          case '/':
            if (num2 != 0) {
              display = (num1! / num2!).toStringAsFixed(2);
            } else {
              display = "Error";
            }
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Pantalla de resultados
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerRight,
          child: Text(
            display,
            style: const TextStyle(fontSize: 48, color: Colors.white),
          ),
        ),

        const Divider(color: Colors.grey),

        // Fila 1
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => onNumberPressed('7'), child: const Text('7')),
            ElevatedButton(onPressed: () => onNumberPressed('8'), child: const Text('8')),
            ElevatedButton(onPressed: () => onNumberPressed('9'), child: const Text('9')),
            ElevatedButton(onPressed: () => onOperatorPressed('+'), child: const Text('+')),
          ],
        ),

        // Fila 2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => onNumberPressed('4'), child: const Text('4')),
            ElevatedButton(onPressed: () => onNumberPressed('5'), child: const Text('5')),
            ElevatedButton(onPressed: () => onNumberPressed('6'), child: const Text('6')),
            ElevatedButton(onPressed: () => onOperatorPressed('-'), child: const Text('-')),
          ],
        ),

        // Fila 3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => onNumberPressed('1'), child: const Text('1')),
            ElevatedButton(onPressed: () => onNumberPressed('2'), child: const Text('2')),
            ElevatedButton(onPressed: () => onNumberPressed('3'), child: const Text('3')),
            ElevatedButton(onPressed: () => onOperatorPressed('*'), child: const Text('*')),
          ],
        ),

        // Fila 4
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => onNumberPressed('0'), child: const Text('0')),
            ElevatedButton(onPressed: onClearPressed, child: const Text('C')),
            ElevatedButton(onPressed: onEqualsPressed, child: const Text('=')),
            ElevatedButton(onPressed: () => onOperatorPressed('/'), child: const Text('/')),
          ],
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}