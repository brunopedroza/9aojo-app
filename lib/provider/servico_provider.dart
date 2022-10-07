import 'package:get/get.dart';
import '../constants.dart';

abstract class ServicoProviderInterface {
  Future<Response> getServicos();
}

class ServicoProvider extends GetConnect implements ServicoProviderInterface {
  @override
  Future<Response> getServicos() => get('${Constants.url}/servico');
}
