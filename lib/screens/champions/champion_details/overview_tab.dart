import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:app_lol/model/networking/champion_model.dart';

class OverviewTab extends StatefulWidget {
  final ChampionModel champion;

  const OverviewTab({super.key, required this.champion});

  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  int _level = 1;

  @override
  Widget build(BuildContext context) {
    final champion = widget.champion;

    String formatStat(double base, double perLevel, int level) {
      if (level == 1) {
        return "${base.toStringAsFixed(1)} (+${perLevel.toStringAsFixed(2)})";
      }
      return (base + perLevel * (level - 1)).toStringAsFixed(2);
    }

    final List<Map<String, dynamic>> stats = [
      {
        'icon': 'assets/icons/vida.png',
        'name': 'Vida',
        'value': formatStat(champion.hp, champion.hpPerLevel, _level)
      },
      {
        'icon': 'assets/icons/Poder_de_Cura.png',
        'name': 'Regen de Vida',
        'value': formatStat(champion.hpRegen, champion.hpRegenPerLevel, _level)
      },
      {
        'icon': 'assets/icons/Mana_icon.png',
        'name': 'Mana',
        'value': formatStat(champion.mp, champion.mpPerLevel, _level)
      },
      {
        'icon': 'assets/icons/Mana_regeneration_icon.png',
        'name': 'Regen de Mana',
        'value': formatStat(champion.mpRegen, champion.mpRegenPerLevel, _level)
      },
      {
        'icon': 'assets/icons/Dano_de_Ataque_3Fcone.png',
        'name': 'Dano',
        'value': formatStat(
            champion.attackDamage, champion.attackDamagePerLevel, _level)
      },
      {
        'icon': 'assets/icons/Velocidade_de_Movimento__cone.png',
        'name': 'Velocidade',
        'value': champion.moveSpeed.toStringAsFixed(3)
      },
      {
        'icon': 'assets/icons/Armor_icon.png',
        'name': 'Armadura',
        'value': formatStat(champion.armor, champion.armorPerLevel, _level)
      },
      {
        'icon': 'assets/icons/resistencia_magica.png',
        'name': 'Resist. Mágica',
        'value':
            formatStat(champion.spellBlock, champion.spellBlockPerLevel, _level)
      },
      {
        'icon': 'assets/icons/alcance.png',
        'name': 'Alcance',
        'value': champion.attackRange.toStringAsFixed(3)
      },
      {
        'icon': 'assets/icons/Chance_de_Acerto_Cr3Fcone.png',
        'name': 'Crítico',
        'value': formatStat(champion.crit, champion.critPerLevel, _level)
      },
      {
        'icon': 'assets/icons/Attack_speed_icon.png',
        'name': 'Ataque Speed',
        'value': formatStat(
            champion.attackSpeed, champion.attackSpeedPerLevel, _level)
      },
    ];

    Widget buildStatBar(String label, int value, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0), 
    child: Container(
      padding: const EdgeInsets.all(8), 
      decoration: BoxDecoration(
        color: Colors.grey.shade300, 
        borderRadius: BorderRadius.circular(3), 
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8), 
          Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8), 
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300], 
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: value / 10, 
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8), 
          const Text('10', style: TextStyle(fontWeight: FontWeight.bold)), 
        ],
      ),
    ),
  );
}

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              width: 340,
              height: 220,
              child: Swiper(
                itemCount:
                    champion.skins.isNotEmpty ? champion.skins.length : 1,
                autoplay: true,
                controller: SwiperController(),
                autoplayDelay: 5000,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      champion.skins.isNotEmpty
                          ? champion.skins[index]
                          : champion.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                ' "${champion.lore}" ',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                buildStatBar("Ataque        ", champion.attack, const Color.fromARGB(255, 114, 113, 113)),
                buildStatBar("Defesa        ", champion.defense, const Color.fromARGB(255, 114, 113, 113)),
                buildStatBar("Magia         ", champion.magic, const Color.fromARGB(255, 114, 113, 113)),
                buildStatBar("Dificuldade", champion.difficulty, const Color.fromARGB(255, 114, 113, 113)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nível:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _level > 1
                      ? () {
                          setState(() {
                            _level--;
                          });
                        }
                      : null,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$_level',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _level < 18
                      ? () {
                          setState(() {
                            _level++;
                          });
                        }
                      : null,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: stats.length,
                  itemBuilder: (context, index) {
                    final stat = stats[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.01),
                        child: Row(
                          children: [
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                              child: Image.asset(
                                stat['icon'],
                                width: 25,
                                height: 25,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    stat['name'],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    stat['value'].toString(),
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
