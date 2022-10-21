import 'package:abctechapp/constants.dart';
import 'package:abctechapp/model/ordemservico.dart';
import 'package:get/get.dart';

abstract class OrdemServicoProviderInterface {
  Future<Response> postOS(OrdemServico ordemServico);
}

class OrdemServicoProvider extends GetConnect
    implements OrdemServicoProviderInterface {
  @override
  Future<Response> postOS(OrdemServico ordemServico) =>
      post('${Constants.url}/ordemservico', ordemServico.toMap());
}
