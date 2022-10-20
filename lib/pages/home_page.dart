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
        itemBuilder: (context, index) =>
            ListTile(title: Text(servicolist[index].nome)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(title: const Text('Lista de Serviços')),

      //Body
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                    child: Text('Os serviços disponíveis são:',
                        textAlign: TextAlign.center))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextButton(
                  onPressed: controller.getServicoList,
                  child: const Text('Recarregar Lista'),
                ))
              ],
            ),
            controller.obx((state) => renderServico(state ?? []),
                onEmpty: const Text('Nenhum Serviço Encontrado'),
                onError: (error) => Text(error.toString()),
                onLoading: const Text('Carregando'))
          ],
        ),
      ),
    );
  }
}
