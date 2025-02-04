import 'package:flutter/material.dart';
import 'package:app_lol/components/custom_search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose(); // Libera recursos ao sair da página
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchField(
              controller: _searchController, // Passando o controller
              hintText: 'Procurar um invocador',
              onChanged: (value) {
                print('Texto digitado: $value');
              },
              onSuffixIconPressed: () {
                setState(() {
                  _searchController.clear(); // Limpa o campo de busca
                });
                print('Ícone de limpar pressionado');
              },
            ),
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
