import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ChampionModel {
  final String id;
  final String name;
  final String imageUrl;
  final String lore;
  final List<String> skins;
  final double hp;
  final double hpPerLevel;
  final double mp;
  final double mpPerLevel;
  final double moveSpeed;
  final double armor;
  final double armorPerLevel;
  final double spellBlock;
  final double spellBlockPerLevel;
  final double attackRange;
  final double hpRegen;
  final double hpRegenPerLevel;
  final double mpRegen;
  final double mpRegenPerLevel;
  final double crit;
  final double critPerLevel;
  final double attackDamage;
  final double attackDamagePerLevel;
  final double attackSpeed;
  final double attackSpeedPerLevel;
  final int attack;
  final int defense;
  final int magic;
  final int difficulty;
  final String imagePassive;
  final String imageQ;
  final String imageW;
  final String imageE;
  final String imageR;
  final String namePassive;
  final String nameQ;
  final String nameW;
  final String nameE;
  final String nameR;
  final String descriptionPassive;
  final String descriptionQ;
  final String descriptionW;
  final String descriptionE;
  final String descriptionR;
  final String cooldownBurnQ;
  final String cooldownBurnW;
  final String cooldownBurnE;
  final String cooldownBurnR;
  final int champeonKey;

  ChampionModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lore,
    required this.skins,
    required this.hp,
    required this.hpPerLevel,
    required this.mp,
    required this.mpPerLevel,
    required this.moveSpeed,
    required this.armor,
    required this.armorPerLevel,
    required this.spellBlock,
    required this.spellBlockPerLevel,
    required this.attackRange,
    required this.hpRegen,
    required this.hpRegenPerLevel,
    required this.mpRegen,
    required this.mpRegenPerLevel,
    required this.crit,
    required this.critPerLevel,
    required this.attackDamage,
    required this.attackDamagePerLevel,
    required this.attackSpeed,
    required this.attackSpeedPerLevel,
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
    required this.imagePassive,
    required this.imageQ,
    required this.imageW,
    required this.imageE,
    required this.imageR,
    required this.namePassive,
    required this.nameQ,
    required this.nameW,
    required this.nameE,
    required this.nameR,
    required this.descriptionPassive,
    required this.descriptionQ,
    required this.descriptionW,
    required this.descriptionE,
    required this.descriptionR,
    required this.cooldownBurnQ,
    required this.cooldownBurnW,
    required this.cooldownBurnE,
    required this.cooldownBurnR,
    required this.champeonKey,
  });

  factory ChampionModel.fromJson(Map<String, dynamic> json) {
    const String version = "15.2.1";

    return ChampionModel(
      id: json['id'],
      name: json['name'],
      imageUrl:
          "https://ddragon.leagueoflegends.com/cdn/$version/img/champion/${json['image']['full']}",
      lore: json['lore'] ?? "Lore não disponível.",
      skins: [],
      hp: (json['stats']['hp'] as num).toDouble(),
      hpPerLevel: (json['stats']['hpperlevel'] as num).toDouble(),
      mp: (json['stats']['mp'] as num).toDouble(),
      mpPerLevel: (json['stats']['mpperlevel'] as num).toDouble(),
      moveSpeed: (json['stats']['movespeed'] as num).toDouble(),
      armor: (json['stats']['armor'] as num).toDouble(),
      armorPerLevel: (json['stats']['armorperlevel'] as num).toDouble(),
      spellBlock: (json['stats']['spellblock'] as num).toDouble(),
      spellBlockPerLevel:
          (json['stats']['spellblockperlevel'] as num).toDouble(),
      attackRange: (json['stats']['attackrange'] as num).toDouble(),
      hpRegen: (json['stats']['hpregen'] as num).toDouble(),
      hpRegenPerLevel: (json['stats']['hpregenperlevel'] as num).toDouble(),
      mpRegen: (json['stats']['mpregen'] as num).toDouble(),
      mpRegenPerLevel: (json['stats']['mpregenperlevel'] as num).toDouble(),
      crit: (json['stats']['crit'] as num).toDouble(),
      critPerLevel: (json['stats']['critperlevel'] as num).toDouble(),
      attackDamage: (json['stats']['attackdamage'] as num).toDouble(),
      attackDamagePerLevel:
          (json['stats']['attackdamageperlevel'] as num).toDouble(),
      attackSpeed: (json['stats']['attackspeed'] as num).toDouble(),
      attackSpeedPerLevel:
          (json['stats']['attackspeedperlevel'] as num).toDouble(),
      attack: (json['info']['attack']),
      defense: (json['info']['defense']),
      magic: (json['info']['magic']),
      difficulty: (json['info']['difficulty']),
      imagePassive: json['passive']?['image']?['full'] != null
          ? "https://ddragon.leagueoflegends.com/cdn/$version/img/passive/${json['passive']['image']['full']}"
          : "https://via.placeholder.com/64", // Imagem padrão caso não exista

      imageQ: json['spells'] != null &&
              json['spells'].isNotEmpty &&
              json['spells'][0]?['image']?['full'] != null
          ? "https://ddragon.leagueoflegends.com/cdn/$version/img/spell/${json['spells'][0]['image']['full']}"
          : "https://via.placeholder.com/64", // Imagem padrão caso não exista

      imageW: json['spells'] != null &&
              json['spells'].length > 1 &&
              json['spells'][1]?['image']?['full'] != null
          ? "https://ddragon.leagueoflegends.com/cdn/$version/img/spell/${json['spells'][1]['image']['full']}"
          : "https://via.placeholder.com/64", // Imagem padrão caso não exista

      imageE: json['spells'] != null &&
              json['spells'].length > 2 &&
              json['spells'][2]?['image']?['full'] != null
          ? "https://ddragon.leagueoflegends.com/cdn/$version/img/spell/${json['spells'][2]['image']['full']}"
          : "https://via.placeholder.com/64", // Imagem padrão caso não exista

      imageR: json['spells'] != null &&
              json['spells'].length > 3 &&
              json['spells'][3]?['image']?['full'] != null
          ? "https://ddragon.leagueoflegends.com/cdn/$version/img/spell/${json['spells'][3]['image']['full']}"
          : "https://via.placeholder.com/64", // Imagem padrão caso não exista
      namePassive:
          json['passive']?['name']?.toString() ?? "Nome não disponível",
      nameQ: (json['spells'] is List && json['spells'].length > 0)
          ? (json['spells'][0]['name'] ?? "Nome não disponível").toString()
          : "Nome não disponível",

      nameW: (json['spells'] is List && json['spells'].length > 1)
          ? (json['spells'][1]['name'] ?? "Nome não disponível").toString()
          : "Nome não disponível",

      nameE: (json['spells'] is List && json['spells'].length > 2)
          ? (json['spells'][2]['name'] ?? "Nome não disponível").toString()
          : "Nome não disponível",

      nameR: (json['spells'] is List && json['spells'].length > 3)
          ? (json['spells'][3]['name'] ?? "Nome não disponível").toString()
          : "Nome não disponível",
      descriptionPassive: json['passive']?['description']?.toString() ??
          "Descrição não disponível",
      descriptionQ: (json['spells'] is List && json['spells'].length > 0)
          ? json['spells'][0]['description']?.toString() ??
              "Descrição não disponível"
          : "Descrição não disponível",
      descriptionW: (json['spells'] is List && json['spells'].length > 1)
          ? json['spells'][1]['description']?.toString() ??
              "Descrição não disponível"
          : "Descrição não disponível",
      descriptionE: (json['spells'] is List && json['spells'].length > 2)
          ? json['spells'][2]['description']?.toString() ??
              "Descrição não disponível"
          : "Descrição não disponível",
      descriptionR: (json['spells'] is List && json['spells'].length > 3)
          ? json['spells'][3]['description']?.toString() ??
              "Descrição não disponível"
          : "Descrição não disponível",
      cooldownBurnQ: (json['spells'] is List && json['spells'].length > 0)
          ? json['spells'][0]['cooldownBurn']?.toString() ??
              "Cooldown não disponível"
          : "Cooldown não disponível",
      cooldownBurnW: (json['spells'] is List && json['spells'].length > 1)
          ? json['spells'][1]['cooldownBurn']?.toString() ??
              "Cooldown não disponível"
          : "Cooldown não disponível",
      cooldownBurnE: (json['spells'] is List && json['spells'].length > 2)
          ? json['spells'][2]['cooldownBurn']?.toString() ??
              "Cooldown não disponível"
          : "Cooldown não disponível",
      cooldownBurnR: (json['spells'] is List && json['spells'].length > 3)
          ? json['spells'][3]['cooldownBurn']?.toString() ??
              "Cooldown não disponível"
          : "Cooldown não disponível",
      champeonKey: int.parse(json['key']),
    );
  }

  static Future<ChampionModel> fetchChampionDetails(String championId) async {
    const String version = "15.2.1";
    final String url =
        "https://ddragon.leagueoflegends.com/cdn/$version/data/pt_BR/champion/$championId.json";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedJson = convert.utf8.decode(response.bodyBytes);
      final data = json.decode(decodedJson);
      final championData = data['data'][championId];

      ChampionModel champion = ChampionModel.fromJson(championData);

      List<String> skinsList = [];
      if (championData['skins'] != null) {
        skinsList = (championData['skins'] as List)
            .map<String>((skin) =>
                "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.id}_${skin['num']}.jpg")
            .toList();
      }

      return ChampionModel(
        id: champion.id,
        name: champion.name,
        imageUrl: champion.imageUrl,
        lore: champion.lore,
        skins: skinsList,
        hp: champion.hp,
        hpPerLevel: champion.hpPerLevel,
        mp: champion.mp,
        mpPerLevel: champion.mpPerLevel,
        moveSpeed: champion.moveSpeed,
        armor: champion.armor,
        armorPerLevel: champion.armorPerLevel,
        spellBlock: champion.spellBlock,
        spellBlockPerLevel: champion.spellBlockPerLevel,
        attackRange: champion.attackRange,
        hpRegen: champion.hpRegen,
        hpRegenPerLevel: champion.hpRegenPerLevel,
        mpRegen: champion.mpRegen,
        mpRegenPerLevel: champion.mpRegenPerLevel,
        crit: champion.crit,
        critPerLevel: champion.critPerLevel,
        attackDamage: champion.attackDamage,
        attackDamagePerLevel: champion.attackDamagePerLevel,
        attackSpeed: champion.attackSpeed,
        attackSpeedPerLevel: champion.attackSpeedPerLevel,
        attack: champion.attack,
        defense: champion.defense,
        magic: champion.magic,
        difficulty: champion.difficulty,
        imagePassive: champion.imagePassive,
        imageQ: champion.imageQ,
        imageW: champion.imageW,
        imageE: champion.imageE,
        imageR: champion.imageR,
        namePassive: champion.namePassive,
        nameQ: champion.nameQ,
        nameW: champion.nameW,
        nameE: champion.nameE,
        nameR: champion.nameR,
           descriptionPassive: champion.descriptionPassive,
        descriptionQ: champion.descriptionQ,
        descriptionW: champion.descriptionW,
        descriptionE: champion.descriptionE,
        descriptionR: champion.descriptionR,
        cooldownBurnQ: champion.cooldownBurnQ,
        cooldownBurnW: champion.cooldownBurnW,
        cooldownBurnE: champion.cooldownBurnE,
        cooldownBurnR: champion.cooldownBurnR,
        champeonKey: champion.champeonKey,
      );
    } else {
      throw Exception("Erro ao carregar detalhes do campeão.");
    }
  }
}
