class ChampionModel {
  final String id;
  final String name;
  final String imageUrl;
  final String lore;
  final List<String> skins;

  ChampionModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lore,
    required this.skins,
  });

  factory ChampionModel.fromJson(Map<String, dynamic> json) {
    List<String> skinsList = [];
    if (json['skins'] != null) {
      skinsList = (json['skins'] as List)
          .map((skin) => "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${json['id']}_${skin['num']}.jpg")
          .toList();
    }

    return ChampionModel(
      id: json['id'],
      name: json['name'],
      imageUrl: "https://ddragon.leagueoflegends.com/cdn/15.2.1/img/champion/${json['image']['full']}",
      lore: json['blurb'] ?? "Lore não disponível.",
      skins: skinsList,
    );
  }
}
