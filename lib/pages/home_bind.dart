import 'package:abctechapp/controller/servico_controller.dart';
import 'package:get/get.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicoController>(() => ServicoController());
  }
}
