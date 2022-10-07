import 'package:abctechapp/model/servico.dart';
import 'package:abctechapp/provider/servico_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServicoService extends GetxService {
  late ServicoProviderInterface _servicoProvider;
  Future<List<Servico>> getServicos() async {
    Response response = await _servicoProvider.getServicos();

    if (response.hasError) {
      return Future.error(ErrorDescription('Erro na conexão'));
    }

    try {
      List<Servico> listResult =
          response.body.map<Servico>((item) => Servico.fromMap(item)).toList();
      return Future.sync(() => listResult);
    } catch (e) {
      e.printError();
      return Future.error(e.toString());
    }
  }
}
