import 'package:bootcamp_2023_dio_via_cep/controller/via_cep_controller.dart';
import 'package:bootcamp_2023_dio_via_cep/pages/home_page.dart';
import 'package:bootcamp_2023_dio_via_cep/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ViaCepController(ViaCepRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CEP',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          //useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
