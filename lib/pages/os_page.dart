import 'package:abctechapp/controller/ordem_servico_controller.dart';
import 'package:abctechapp/model/servico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrdemServicoPage extends GetView<OrdemServicoController> {
  const OrdemServicoPage({Key? key}) : super(key: key);

  Widget renderServicos(List<Servico> servicos) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: servicos.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(servicos[index].nome)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Ordens de Serviço'),
        ),
        body: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(children: const [
                        Expanded(
                            child: Text(
                          'Preencha o formulário para registrar uma nova Ordem de Serviço',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ))
                      ]),
                      TextFormField(
                        controller: controller.idPrestadorController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Insira o código do prestador"),
                        textAlign: TextAlign.center,
                      ),
                      Row(children: [
                        const Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(top: 25, bottom: 25),
                                child: Text(
                                  'Selecione os serviços a serem prestados',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ))),
                        Ink(
                            decoration: const ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.blueAccent),
                            child: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () => controller.editServicos()),
                            width: 40,
                            height: 40),
                      ]),
                      Obx(
                        () => renderServicos(controller.servicosSelecionados),
                      ),
                      Row(children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () =>
                                    controller.finishStartOrdemServico(),
                                child: const Text('Fechar OS')))
                      ]),
                    ]),
              ),
            )));
  }
}
