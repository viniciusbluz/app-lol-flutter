import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_lol/model/networking/champion_model.dart';

class ChampionDetailPage extends StatelessWidget {
  final ChampionModel champion;

  const ChampionDetailPage({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(champion.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Carrossel de skins do campeão (substitua pelos URLs reais)
              if (champion.skins.isNotEmpty)
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: champion.skins.map((imageUrl) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                      ),
                    );
                  }).toList(),
                ),

              const SizedBox(height: 16),

              // Imagem principal com Hero Animation
              Hero(
                tag: 'champion-${champion.name}',
                child: ClipOval(
                  child: Image.network(
                    champion.imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 150, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                champion.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  champion.lore,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
