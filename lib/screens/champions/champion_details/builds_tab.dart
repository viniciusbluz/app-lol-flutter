import 'package:flutter/material.dart';

class BuildsTab extends StatelessWidget {
  const BuildsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sugestões de builds",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
