import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

enum RequestType { get, post, put, delete }

class NetworkManager {
  NetworkManager._();
  static NetworkManager? _instance;
  factory NetworkManager() => _instance ??= NetworkManager._();

  http.Response? response;
  Map<String, String> headers = {};
  Duration timeOut = const Duration(seconds: 5);

  void _setNetworkManagerHeader() {
    headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<Model?> execute<Model>({
    required String endPoint,
    RequestType requestType = RequestType.get,
    Map<String, dynamic>? requestParameters,
    required Model Function(String jsonString) decodeCallBack,
    required void Function(String error) errorCallBack,
  }) async {
    final String url = "https://ddragon.leagueoflegends.com/cdn/15.2.1/$endPoint".trim();
    Uri uri = Uri.parse(url);
    debugPrint("RequestUrl: $url");
    debugPrint("RequestBody: $requestParameters");
    _setNetworkManagerHeader();

    try {
      switch (requestType) {
        case RequestType.get:
          uri = uri.replace(queryParameters: requestParameters);
          response = await http.get(uri, headers: headers).timeout(timeOut);
          break;
        case RequestType.post:
          final body = json.encode(requestParameters);
          response = await http.post(uri, body: body, headers: headers).timeout(timeOut);
          break;
        case RequestType.put:
          final body = json.encode(requestParameters);
          response = await http.put(uri, body: body, headers: headers).timeout(timeOut);
          break;
        case RequestType.delete:
          final body = json.encode(requestParameters);
          response = await http.delete(uri, body: body, headers: headers).timeout(timeOut);
          break;
      }

      if (response != null && response?.statusCode == 200 && response!.body.isNotEmpty) {
        return decodeCallBack(response!.body);
      } else {
        throw ErrorDescription("Erro: Status Code ${response?.statusCode}");
      }
    } catch (error) {
      errorCallBack(error.toString());
    }
    return null;
  }
}
