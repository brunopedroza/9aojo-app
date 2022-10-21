import 'package:abctechapp/model/ordemservico.dart';
import 'package:abctechapp/model/ordemservico_criada.dart';
import 'package:abctechapp/provider/ordemservico_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdemServicoServiceInterface {
  Future<OrdemServicoCriada> criarOrdemServico(OrdemServico ordemServico);
}

class OrdemServicoService extends GetxService
    implements OrdemServicoServiceInterface {
  final OrdemServicoProviderInterface _ordemServicoProviderInterface;
  OrdemServicoService(this._ordemServicoProviderInterface);

  @override
  Future<OrdemServicoCriada> criarOrdemServico(
      OrdemServico ordemServico) async {
    Response response =
        await _ordemServicoProviderInterface.postOS(ordemServico);
    if (response.hasError) {
      return Future.error(ErrorDescription("Erro na conexao"));
    }

    try {
      return Future.sync(() => OrdemServicoCriada(true, ""));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription("Erro não esperado"));
    }
  }
}
