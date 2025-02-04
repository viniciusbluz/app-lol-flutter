import 'package:flutter/material.dart';

class FilterPopUp extends StatelessWidget {
  const FilterPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 12), // Ajustando as margens
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      margin: const EdgeInsets.only(
          bottom: 30), // Margem inferior para afastar do fundo
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Garante que o popup não ocupe a tela toda
        children: [
          const Text(
            'Ordenar Campeões Por',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildFilterOption(context, 'Nome', Icons.filter_1),
          _buildFilterOption(context, 'Data de Lançamento', const IconData(0xf06bb, fontFamily: 'MaterialIcons')),
          _buildFilterOption(context, 'Essência Azul', Icons.filter_3),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
            style: TextButton.styleFrom(
              side: BorderSide(color: Colors.red), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 40), 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(BuildContext context, String text, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 28, color: Colors.blue),
          title: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            Navigator.of(context).pop(); 
            // Adicione aqui a ação do filtro
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: Colors.grey[200], 
        ),
        const Divider(
            height: 1, thickness: 1, color: Colors.grey), 
      ],
    );
  }
}
