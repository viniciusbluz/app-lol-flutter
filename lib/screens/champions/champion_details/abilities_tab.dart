import 'package:flutter/material.dart';
import 'package:app_lol/model/networking/champion_model.dart';

class AbilitiesTab extends StatelessWidget {
  final ChampionModel champion;

  const AbilitiesTab({Key? key, required this.champion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final abilities = [
      {
        "name": champion.namePassive,
        "image": champion.imagePassive,
        "description": champion.descriptionPassive,
        "cooldown": "Passiva",
      },
      {
        "name": champion.nameQ,
        "image": champion.imageQ,
        "description": champion.descriptionQ,
        "cooldown": champion.cooldownBurnQ,
      },
      {
        "name": champion.nameW,
        "image": champion.imageW,
        "description": champion.descriptionW,
        "cooldown": champion.cooldownBurnW,
      },
      {
        "name": champion.nameE,
        "image": champion.imageE,
        "description": champion.descriptionE,
        "cooldown": champion.cooldownBurnE,
      },
      {
        "name": champion.nameR,
        "image": champion.imageR,
        "description": champion.descriptionR,
        "cooldown": champion.cooldownBurnR,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Habilidades de ${champion.name}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: abilities.length,
              itemBuilder: (context, index) {
                final ability = abilities[index];
                return _buildAbilityTile(
                  context,
                  abilityName: ability["name"]!,
                  imageUrl: ability["image"]!,
                  description: ability["description"]!,
                  cooldown: ability["cooldown"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbilityTile(
    BuildContext context, {
    required String abilityName,
    required String imageUrl,
    required String description,
    required String cooldown,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _showAbilityModal(context, abilityName, imageUrl, description, cooldown),
            child: Image.network(
              imageUrl,
              width: 48,
              height: 48,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 48, color: Colors.red),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  abilityName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  "Tempo de Recarga: $cooldown",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAbilityModal(
    BuildContext context,
    String abilityName,
    String imageUrl,
    String description,
    String cooldown,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.network(
                      imageUrl,
                      width: 64,
                      height: 64,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error, size: 64, color: Colors.red),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        abilityName,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 250,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Vídeo da habilidade aqui , key: ${champion.champeonKey}",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Fechar"),
              ),
            ],
          ),
        );
      },
    );
  }
}
