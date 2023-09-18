import 'package:bootcamp_2023_dio_via_cep/controller/via_cep_controller.dart';
import 'package:bootcamp_2023_dio_via_cep/widgets/widgets.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BuscarCep extends StatelessWidget {
  const BuscarCep({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<ViaCepController>();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          createWidgetStatus(),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (String cep) {},
                  controller: controller.cepController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                ),
              ),
              createWidgetStatusButton(),
            ],
          ),
        ],
      ),
    );
  }
}