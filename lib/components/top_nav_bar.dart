import 'package:flutter/material.dart';
//import 'package:icon_forest/icon_forest.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: const BoxDecoration(
          color: Colors.transparent, 
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, 
          children: [
            const Text(
              'App logo',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset('assets/icons/perfil_user.png', height: 21, width: 21,),
                  onPressed: () {
                    // Ação para o botão de perfil
                  },
                ),
                IconButton(
                 icon: Image.asset('assets/icons/settings.png', height: 30, width: 30,),
                  onPressed: () {
                    // Ação para o botão de configurações
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
