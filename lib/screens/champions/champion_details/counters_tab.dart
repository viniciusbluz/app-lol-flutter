import 'package:flutter/material.dart';

class CountersTab extends StatelessWidget {
  const CountersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Lista de counters",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
