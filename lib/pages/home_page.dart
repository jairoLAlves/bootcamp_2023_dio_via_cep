import 'package:bootcamp_2023_dio_via_cep/controller/via_cep_controller.dart';
import 'package:bootcamp_2023_dio_via_cep/model/cep_model.dart';
import 'package:bootcamp_2023_dio_via_cep/widgets/widgets.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ViaCepController viaCepController;

  @override
  void initState() {
    super.initState();

    viaCepController = context.read<ViaCepController>();
    viaCepController.updateListCep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta  CEP'),
      ),
      body: PageView(
        children: const [
          BuscaCep(),
          ListaCep(),
        ],
      ),
    );
  }
}

class ListaCep extends StatefulWidget {
  const ListaCep({super.key});

  @override
  State<ListaCep> createState() => _ListaCepState();
}

class _ListaCepState extends State<ListaCep> {
  @override
  Widget build(BuildContext context) {
    var controller = context.read<ViaCepController>();

    return Container(
      child: ListView.builder(
        itemCount: controller.getListCep.length,
        itemBuilder: (context, index) {
          CepModel cepModel = controller.getListCep[index];
          return CreateItemCep(cepModel);
        },
      ),
    );
  }
}

class BuscaCep extends StatelessWidget {
  const BuscaCep({super.key});

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
