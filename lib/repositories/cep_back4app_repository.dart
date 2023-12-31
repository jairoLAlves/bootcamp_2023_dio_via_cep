import "package:bootcamp_2023_dio_via_cep/model/cep_model.dart";
import "package:bootcamp_2023_dio_via_cep/services/cep_back4app_service.dart";
import "package:flutter/foundation.dart";

class CepBack4appRepository {
  CepBack4appService cepBack4appService = CepBack4appService();

  Future<List<CepModel>> getCepList() async {
    List<CepModel> listaResult = [];
    List<Map<String, dynamic>> listMap =
        await cepBack4appService.getCepListBack4App();

    // if (map.containsKey('results')) {
    //   throw Exception('Erro ');
    // } else {
    //   cepModel = CepModel.fromJson(map);
    // }
    listaResult = listMap.map((cepMap) => CepModel.fromJson(cepMap)).toList();

    return listaResult;
  }

  Future<void> deleteCep(CepModel cepModel) async {
    try {
      await cepBack4appService.deleteCep(cepModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  Future<void> saveCep(CepModel cepModel) async {
    try {
      await cepBack4appService.saveCep(cepModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
