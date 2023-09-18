import 'package:bootcamp_2023_dio_via_cep/controller/via_cep_controller.dart';
import 'package:bootcamp_2023_dio_via_cep/enums/enums.dart';
import 'package:bootcamp_2023_dio_via_cep/model/cep_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

createWidgetStatusButton() {
  return Consumer<ViaCepController>(
    builder: (context, controller, _) => switch (controller.status.value) {
      Status.start || Status.success || Status.error => ElevatedButton(
          onPressed: () {
            controller.getCep();
          },
          child: const Text("Buscar")),
      Status.loading => const Center(child: CircularProgressIndicator()),
    },
  );
}

createWidgetStatus() {
  return Consumer<ViaCepController>(
    builder: (context, controller, _) => switch (controller.status.value) {
      Status.start => Container(),
      Status.loading => const Center(child: CircularProgressIndicator()),
      Status.success => Container(
          padding: const EdgeInsets.all(8),
          child: ValueListenableBuilder<CepModel>(
              valueListenable: controller.cepInfo,
              builder: (context, cepInfo, _) => CreateItemCep(cepInfo, () {
                    if (!cepInfo.isSave) {
                      controller.saveCep(cepInfo);
                    }
                  })),
        ),
      Status.error => Container(),
    },
  );
}

Widget CreateItemCep(CepModel cepModel, Function fun) {
  return Stack(children: [
    Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (cepModel.cep.isNotEmpty) Text(' cep: ${cepModel.cep}'),
            if (cepModel.logradouro.isNotEmpty)
              Text(' logradouro: ${cepModel.logradouro}'),
            if (cepModel.complemento.isNotEmpty)
              Text(' complemento: ${cepModel.complemento}'),
            if (cepModel.bairro.isNotEmpty) Text(' bairro: ${cepModel.bairro}'),
            if (cepModel.localidade.isNotEmpty)
              Text(' localidade: ${cepModel.localidade}'),
            if (cepModel.uf.isNotEmpty) Text(' uf: ${cepModel.uf}'),
            if (cepModel.ibge.isNotEmpty) Text(' ibge: ${cepModel.ibge}'),
            if (cepModel.gia.isNotEmpty) Text(' gia: ${cepModel.gia}'),
            if (cepModel.ddd.isNotEmpty) Text(' ddd: ${cepModel.ddd}'),
            if (cepModel.siafi.isNotEmpty) Text(' siafi: ${cepModel.siafi}'),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        fun();
      },
      child: Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.star,
          color: cepModel.isSave ? Colors.orange : Colors.black,
        ),
      ),
    )
  ]);
}
