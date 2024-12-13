import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final VoidCallback onSuffixIconPressed;

  const CustomSearchField({
    Key? key,
    this.hintText = '',
    required this.onSuffixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFFB8B8D2),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF4F3FD),
          hintText: hintText,
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
            ),
            onPressed: onSuffixIconPressed,
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
