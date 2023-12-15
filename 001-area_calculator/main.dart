import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key, Key? add});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  late TextEditingController _controller;
  String result = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void calculateArea() {
    double radius = double.tryParse(_controller.text) ?? 0;
    double area = math.pi * math.pow(radius, 2);

    setState(() {
      result = 'The area of the circle is $area';
    });

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(result),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Text("Area calculator", style: TextStyle(color: Colors.white)),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter radius (in meters)',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (String value) {},
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity, // Make the button take the full width
              child: ElevatedButton(
                onPressed: () {
                  calculateArea();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 12.0,
                  shape: RoundedRectangleBorder(
                    //to set border radius to button
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
                child: const Text('CALCULATE',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}