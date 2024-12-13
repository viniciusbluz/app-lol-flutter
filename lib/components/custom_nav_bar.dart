import 'package:flutter/material.dart';
import 'nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  final String selectedRouter;
  final Function(String) routeCallBack;

  const CustomNavBar({
    super.key,
    required this.selectedRouter,
    required this.routeCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(231, 229, 229, 100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarItem(
              assetPath: 'assets/icons/home_navbar.png',
              label: 'Início',
              isSelected: selectedRouter == '/home-page',
              onTap: () => routeCallBack('/home-page'),
            ),
            NavBarItem(
              assetPath: 'assets/icons/analytics_navbar.png',
              label: 'Estatística',
              isSelected: selectedRouter == '/statistics-page',
              onTap: () => routeCallBack('/statistics-page'),
            ),
            NavBarItem(
              assetPath: 'assets/icons/helmet_navbar.png',
              label: 'Campeão',
              isSelected: selectedRouter == '/champions-page',
              onTap: () => routeCallBack('/champions-page'),
            ),
            NavBarItem(
              assetPath: 'assets/icons/calculator_navbar.png',
              label: 'Calculadora',
              isSelected: selectedRouter == '/calculator-page',
              onTap: () => routeCallBack('/calculator-page'),
            ),
            NavBarItem(
              assetPath: 'assets/icons/book_navbar.png',
              label: 'Wiki',
              isSelected: selectedRouter == '/wiki-page',
              onTap: () => routeCallBack('/wiki-page'),
            ),
          ],
        ),
      ),
    );
  }
}
