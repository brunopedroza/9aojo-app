import 'package:abctechapp/pages/home_bind.dart';
import 'package:abctechapp/pages/home_page.dart';
import 'package:abctechapp/provider/servico_provider.dart';
import 'package:abctechapp/services/servico_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

// Adicionamos o serviço service e suas depenências para nosso framework Get a nivel global
void initServices() {
  Get.lazyPut(() => ServicoService(servicoProvider: ServicoProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ABC Tech App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      getPages: [
        GetPage(name: '/', page: () => const HomePage(), binding: HomeBind())
      ],
    );
  }
}
