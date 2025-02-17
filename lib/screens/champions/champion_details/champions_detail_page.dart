import 'package:flutter/material.dart';
import 'package:app_lol/model/networking/champion_model.dart';
import 'overview_tab.dart';
import 'abilities_tab.dart';
import 'counters_tab.dart';
import 'builds_tab.dart';

class ChampionDetailPage extends StatefulWidget {
  final String championId;

  const ChampionDetailPage({
    Key? key,
    required this.championId,
  }) : super(key: key);

  @override
  _ChampionDetailPageState createState() => _ChampionDetailPageState();
}

class _ChampionDetailPageState extends State<ChampionDetailPage> {
  late Future<ChampionModel> _championFuture;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _championFuture = ChampionModel.fetchChampionDetails(widget.championId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChampionModel>(
      future: _championFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text("Carregando...")),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text("Erro")),
            body: const Center(
                child: Text("Erro ao carregar detalhes do campeão")),
          );
        }

        final champion = snapshot.data!;

        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: Stack(
                alignment: Alignment.center, 
                children: [
                  Align(
                    alignment:
                        Alignment.centerLeft, 
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://ddragon.leagueoflegends.com/cdn/15.2.1/img/champion/${champion.id}.png",
                      ),
                      radius: 16,
                    ),
                  ),
                  Text(
                    champion.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
              bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: Color.fromARGB(255, 30, 16, 63),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color.fromARGB(255, 30, 16, 63),
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: "Visão Geral"),
                  Tab(text: "Habilidades"),
                  Tab(text: "Counters"),
                  Tab(text: "Builds"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                OverviewTab(champion: champion),
                AbilitiesTab(champion: champion),
                CountersTab(),
                BuildsTab(),
              ],
            ),
          ),
        );
      },
    );
  }
}
