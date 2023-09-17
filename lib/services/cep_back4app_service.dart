import 'dart:convert';

import 'package:bootcamp_2023_dio_via_cep/model/cep_model.dart';
import 'package:bootcamp_2023_dio_via_cep/util/env.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CepBack4appService {
  final String _scheme = 'https';
  final String _host = Env.keyParseServerUrl;
  final String _path = '/classes/CEP';
  final Map<String, String> _headers = {
    'X-Parse-Application-Id': Env.keyApplicationId,
    'X-Parse-REST-API-Key': Env.keyClientKey,
    'Content-Type': 'application/json'
  };

  Future<List<Map<String, dynamic>>> getCepListBack4App() async {
    Uri url = Uri(
      scheme: _scheme,
      host: _host,
      path: _path,
    );

    var result = await http.get(url, headers: _headers);

    if (result.statusCode != 200) {
      throw Exception('Error com o a chamada http');
    }

    var listResult = <Map<String, dynamic>>[];

    var responseMap = jsonDecode(result.body)
        as Map<String, dynamic>; // as List<Map<String, dynamic>>;

    if (responseMap.containsKey('results')) {
      listResult = (responseMap['results'] as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    }

    return listResult;
  }

  Future<void> postCep(CepModel cepModel) async {
    Uri url = Uri(
      scheme: _scheme,
      host: _host,
      path: _path,
    );
    var result =
        await http.post(url, body: cepModel.toJson(), headers: _headers);
    debugPrint(result.toString());
  }
}
