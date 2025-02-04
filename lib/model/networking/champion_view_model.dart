import 'package:app_lol/model/networking/network_manager.dart';
import 'package:app_lol/model/networking/champion_model.dart';
import 'package:app_lol/model/networking/champions_response_model.dart';

class ChampionViewModel {
  Future<List<ChampionModel>> fetchChampions() async {
    return await NetworkManager().execute<List<ChampionModel>>(
      endPoint: "data/pt_BR/champion.json",
      requestType: RequestType.get,
      decodeCallBack: (jsonString) {
        final Map<String, dynamic> decodedJson = ChampionResponseModel.fromJson(jsonString).data ?? {};
        return decodedJson.entries.map((entry) => ChampionModel.fromJson(entry.value)).toList();
      },
      errorCallBack: (error) {
        print("Erro ao buscar campeões: $error");
      },
    ) ?? [];
  }
}
