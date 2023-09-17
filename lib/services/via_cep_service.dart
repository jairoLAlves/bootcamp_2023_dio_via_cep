import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ViaCepService {
  Future<Map<String, dynamic>> getCep(String cep) async {
    Uri url = Uri(
      scheme: 'https',
      host: 'viacep.com.br',
      path: '/ws/$cep/json/',
    );
    debugPrint(url.toString());

    Response response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error com o a chamada http');
    }

    debugPrint(response.body);

    var responseMap = jsonDecode(response.body) as Map<String, dynamic>;
    debugPrint(responseMap.toString());

    return responseMap;
  }
}
