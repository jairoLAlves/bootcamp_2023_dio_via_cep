import 'package:bootcamp_2023_dio_via_cep/model/cep_model.dart';
import 'package:bootcamp_2023_dio_via_cep/services/via_cep_service.dart';

class ViaCepRepository {
  ViaCepService viaCepService = ViaCepService();
  ViaCepRepository();

  Future<CepModel?> getCep(String cep) async {
    Map<String, dynamic> map = await viaCepService.getCep(cep);
    CepModel? cepModel;

    if (map.containsKey('erro')) {
      throw Exception('Cep Inválido!');
    } else {
      cepModel = CepModel.fromJson(map);
    }

    return cepModel;
  }
}
