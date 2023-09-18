import 'dart:convert';

class CepModel {
  String objectId;
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  CepModel({
    required this.objectId,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  bool get isSave =>objectId.isNotEmpty;

  static CepModel empty() {
    return CepModel(
        objectId: '',
        cep: '',
        logradouro: '',
        complemento: '',
        bairro: '',
        localidade: '',
        uf: '',
        ibge: '',
        gia: '',
        ddd: '',
        siafi: '');
  }

  static CepModel fromJson(Map<String, dynamic> json) {
    String objectId = json['objectId'] ?? '';
    String cep = json['cep']?.replaceAll(RegExp(r'[^0-9]'), '');
    String logradouro = json['logradouro'];
    String complemento = json['complemento'];
    String bairro = json['bairro'];
    String localidade = json['localidade'];
    String uf = json['uf'];
    String ibge = json['ibge'];
    String gia = json['gia'];
    String ddd = json['ddd'];
    String siafi = json['siafi'];
    return CepModel(
      objectId: objectId,
      cep: cep,
      logradouro: logradouro,
      complemento: complemento,
      bairro: bairro,
      localidade: localidade,
      uf: uf,
      ibge: ibge,
      gia: gia,
      ddd: ddd,
      siafi: siafi,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }

  @override
  String toString() {
    return 'CepModel(objectId: $objectId, cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }








}
