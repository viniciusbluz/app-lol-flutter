import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final String hintText;
  final VoidCallback onSuffixIconPressed;
  final TextEditingController controller; // Agora obrigatório
  final ValueChanged<String>? onChanged;

  const CustomSearchField({
    Key? key,
    this.hintText = '',
    required this.onSuffixIconPressed,
    required this.controller, // Agora é obrigatório
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: widget.controller, // Usa o controlador corretamente
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF4F3FD),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFFB8B8D2),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFFB8B8D2),
          ),
          suffixIcon: IconButton(
            icon: Image.asset(
              'assets/icons/filter_icon.png',
              height: 21,
              width: 21,
            ), // Ícone de limpar
            onPressed: () {
              widget.controller.clear(); // Agora deve limpar corretamente
              widget.onSuffixIconPressed();
              setState(() {}); // Garante que a UI seja reconstruída
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
