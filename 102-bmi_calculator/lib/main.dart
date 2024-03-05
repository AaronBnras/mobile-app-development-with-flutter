import 'package:flutter/material.dart';
import 'components/image_banner.dart';
// import 'package:my_bmi_calculator/model/calculator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
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
  // BMICalculator myCalculator = BMICalculator.empty();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  String _remark = "Please enter your weight and height to calculate your BMI";
  String _bmi = "-";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(children: [
          Stack(children: <Widget>[
            const ImageBanner("assets/images/background.png"),
            Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 64, 0, 0),
                      child: Text(
                        "Your BMI is:",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                      child: Text(
                        _bmi,
                        style: const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Text(
                      _remark,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ))
          ]),
          Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Weight (Kg)"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _heightController,
                    decoration: const InputDecoration(labelText: "Height (m)"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onPressed: () {
                      String? validationError;
                      if (_weightController.text.isEmpty ||
                          _heightController.text.isEmpty) {
                        validationError = "Please provide your weight and height";
                      }

                      if (validationError != null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.transparent,
                              title: const Text("Error"),
                              content: Text(validationError!),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        var height = double.tryParse(_heightController.text)!;
                        var weight = double.tryParse(_weightController.text)!;


                        Future<void> sendBmiRequest(double weight, double height) async {
                          const url = 'http://localhost:8000/api/v1/calculate_bmi';
                          final Map<String, dynamic> data = {
                            'weight': weight,
                            'height': height,
                          };

                          try {
                            final response = await http.post(
                              Uri.parse(url),
                              body: json.encode(data),
                              headers: {
                                'Content-Type': 'application/json',
                              },
                            );

                            if (response.statusCode == 200) {

                              setState(() {
                                final Map<String, dynamic> responseData = json.decode(response.body);
                                _bmi = responseData['bmi'].toString();
                                _remark = responseData['remark'];
                              });

                            } else {
                              print('Failed with status: ${response.statusCode}');
                              print('Response: ${response.body}');
                            }
                          } catch (e) {

                            print('Error: $e');
                          }
                        }
                        sendBmiRequest(weight, height);
                      }
                    },
                    child: const Text("CALCULATE"),
                  ),
                ],
              )),
          const Expanded(
            child: Center(
              child: SizedBox(
                height: 20,
              ),
            ),
          ),
          const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Body mass index, or BMI, is used to determine whether "
                              "you are in a healthy weight range for your height",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "* This calculator shouldn't be used for pregnant women or children",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ))
            /**/
          )
        ]));
  }
}