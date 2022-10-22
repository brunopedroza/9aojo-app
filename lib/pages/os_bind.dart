import 'package:abctechapp/controller/ordem_servico_controller.dart';
import 'package:abctechapp/provider/ordemservico_provider.dart';
import 'package:abctechapp/services/geolocation_service.dart';
import 'package:abctechapp/services/ordemservico_service.dart';
import 'package:get/get.dart';

class OrdemServicoBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdemServicoController>(() => OrdemServicoController(
        GeolocationService(), OrdemServicoService(OrdemServicoProvider())));
  }
}
