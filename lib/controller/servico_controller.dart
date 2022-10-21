import 'package:abctechapp/services/servico_service.dart';
import 'package:get/get.dart';
import '../model/servico.dart';

class ServicoController extends GetxController with StateMixin<List<Servico>> {
  late ServicoService service;

  @override
  void onInit() {
    super.onInit();
    service = Get.find<ServicoService>();
    getServicoList();
  }

  void getServicoList() {
    change([], status: RxStatus.loading());
    service
        .getServicos()
        .then(((value) => change(value, status: RxStatus.success())))
        .onError((error, stackTrace) =>
            change([], status: RxStatus.error(error.toString())));
  }
}
