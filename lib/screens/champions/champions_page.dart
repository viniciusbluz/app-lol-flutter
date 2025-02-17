import 'package:flutter/material.dart';
import 'package:app_lol/model/networking/champion_model.dart';
import 'package:app_lol/model/networking/champion_view_model.dart';
import 'package:app_lol/screens/champions/champion_details/champions_detail_page.dart';
import 'package:app_lol/components/custom_search_field.dart';
import 'package:app_lol/components/filter_pop_up.dart';

class ChampionsPage extends StatefulWidget {
  const ChampionsPage({super.key});

  @override
  State<ChampionsPage> createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {
  late Future<List<ChampionModel>> _championsFuture;
  List<ChampionModel> _allChampions = [];
  List<ChampionModel> _filteredChampions = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _championsFuture = _fetchChampions();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<ChampionModel>> _fetchChampions() async {
    final champions = await ChampionViewModel().fetchChampions();
    setState(() {
      _allChampions = champions;
      _filteredChampions = champions;
    });
    return champions;
  }

  void _filterChampions(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredChampions = _allChampions;
      } else {
        _filteredChampions = _allChampions
            .where((champion) =>
                champion.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return const FilterPopUp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: FutureBuilder<List<ChampionModel>>(
          future: _championsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Erro ao carregar campeões"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("Nenhum campeão encontrado"));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  CustomSearchField(
                    controller: _searchController,
                    hintText: "Pesquisar campeão...",
                    onChanged: _filterChampions,
                    onSuffixIconPressed: () {
                      setState(() {
                        _searchController.clear();
                        _filterChampions("");
                        _showPopup(context);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 0.68,
                      ),
                      itemCount: _filteredChampions.length,
                      itemBuilder: (context, index) {
                        final champion = _filteredChampions[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    ChampionDetailPage(championId: champion.id,),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipOval(
                                    child: Image.network(
                                      champion.imageUrl,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: Text(
                                    champion.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
