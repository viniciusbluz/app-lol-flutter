import 'package:app_lol/components/custom_search_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, 
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchField(
                hintText: 'Procurar um invocador',
                onSuffixIconPressed: () {
                  print('icone searchfield pressed');
                }),
          ), 
          const Expanded(
            child: Center(
              child: Text(
                'Home Page',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
