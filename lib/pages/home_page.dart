import 'package:abctechapp/controller/servico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/servico.dart';

class HomePage extends GetView<ServicoController> {
  const HomePage({super.key});

  Widget renderServico(List<Servico> servicolist) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: servicolist.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(servicolist[index].nome),
              selectedColor: Colors.blue,
              selected: controller.isSelected(index),
              onTap: () => controller.selectServico(index),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(title: const Text('Lista de Serviços')),

      //Body
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Os serviços disponíveis são:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )))
                ],
              ),
              controller.obx((state) => renderServico(state ?? []),
                  onError: (error) => Text(error.toString()),
                  onEmpty: const Text('Nenhum Serviço Encontrado'),
                  onLoading: const Text('Carregando')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => controller.finishSelectServicos(),
          child: const Icon(Icons.done, color: Colors.white)),
    );
  }
}
