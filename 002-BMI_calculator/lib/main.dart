import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight in KG',
                icon: Icon(Icons.line_weight),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              child: const Text('Calculate', style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  _calculateBMI();
                });
              },
            ),
            const SizedBox(height: 15),
            Text(
              _result != null ? 'BMI: ${_result?.toStringAsFixed(2)}' : 'Enter your details',
              style: const TextStyle(color: Colors.redAccent, fontSize: 19.4, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    double height = double.parse(_heightController.text) / 100; // Convert cm to meters
    double weight = double.parse(_weightController.text);

    _result = weight / (height * height);// Correct BMI formula

  }
}
