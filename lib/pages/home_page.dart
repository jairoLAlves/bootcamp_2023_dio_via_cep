import 'package:bootcamp_2023_dio_via_cep/controller/via_cep_controller.dart';
import 'package:bootcamp_2023_dio_via_cep/model/cep_model.dart';
import 'package:bootcamp_2023_dio_via_cep/pages/buscar_cep.dart';
import 'package:bootcamp_2023_dio_via_cep/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ViaCepController viaCepController;
  PageController pageController = PageController();
  int indexMenu = 0;

  @override
  void initState() {
    super.initState();

    viaCepController = context.read<ViaCepController>();
    viaCepController.updateListCep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexMenu,
        onTap: (value) {
          setState(() {
            indexMenu = value;
            pageController.animateToPage(value,
                duration: const Duration(milliseconds: 600),
                curve: Curves.linear);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'CEPs'),
        ],
      ),
      appBar: AppBar(
        title: const Text('Consulta  CEP'),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          BuscarCep(),
          ListaCep(),
        ],
      ),
    );
  }
}

class ListaCep extends StatelessWidget {
  const ListaCep({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<ViaCepController>();

    return ValueListenableBuilder(
      valueListenable: controller.listCepModel,
      builder: (context, listCepModel, child) => Container(
        child: ListView.builder(
          itemCount: listCepModel.length,
          itemBuilder: (context, index) {
            CepModel cepModel = listCepModel[index];
            return CreateItemCep(cepModel,(){
               showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [Text('Deseja Apagar o Cep?')],
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar')),
                          ElevatedButton(
                              onPressed: () {
                                controller.deleteCep(cepModel);
                                Navigator.pop(context);
                              },
                              child: const Text('OK')),
                        ],
                      ),
                    );
            });
          },
        ),
      ),
    );
  }
}
