import 'package:bootcamp_2023_dio_via_cep/enums/enums.dart';
import 'package:bootcamp_2023_dio_via_cep/model/cep_model.dart';
import 'package:bootcamp_2023_dio_via_cep/repositories/cep_back4app_repository.dart';
import 'package:bootcamp_2023_dio_via_cep/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';

class ViaCepController extends ChangeNotifier {
  final ViaCepRepository viaCepRepository;
  final CepBack4appRepository cepBack4appRepository = CepBack4appRepository();

  ViaCepController(this.viaCepRepository);

  final ValueNotifier<Status> status = ValueNotifier<Status>(Status.start);
  final ValueNotifier<CepModel> cepInfo = ValueNotifier(CepModel.empty());
  TextEditingController cepController = TextEditingController();

  List<CepModel> _listCepModel = [];

  List<CepModel> get getListCep => [..._listCepModel];

  void updateListCep() async {
    try {
      _listCepModel = await cepBack4appRepository.getCepList();
      debugPrint(_listCepModel.toString());

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getCep() {
    String cepText = cepController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (cepText.length == 8) {
      _getCep(cepText);
      debugPrint(cepText);
    }
  }

  Future<void> _getCep(String cep) async {
    status.value = Status.loading;
    notifyListeners();
    try {
      cepInfo.value = await viaCepRepository.getCep(cep) ?? CepModel.empty();
      status.value = Status.success;

      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      status.value = Status.error;
      notifyListeners();
    }
  }
}
