import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Calculator Page', style: TextStyle(fontSize: 24))),
    );
  }
}