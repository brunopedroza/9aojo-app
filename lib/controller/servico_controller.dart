import 'package:abctechapp/services/servico_service.dart';
import 'package:get/get.dart';
import '../model/servico.dart';

class ServicoController extends GetxController with StateMixin<List<Servico>> {
  late ServicoService service;
  List<Servico> todosServicos = [];
  List<Servico> servicosSelecionados = [];

  @override
  void onInit() {
    super.onInit();
    service = Get.find<ServicoService>();
    getServicoList();
  }

  @override
  void onReady() {
    super.onReady();
    servicosSelecionados = Get.arguments;
  }

  void getServicoList() {
    change([], status: RxStatus.loading());
    service.getServicos().then((value) {
      todosServicos = value;
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  void finishSelectServicos() {
    Get.back();
  }

  void selectServico(int index) {
    Servico servicos = todosServicos[index];
    int indexFound =
        servicosSelecionados.indexWhere((element) => element.id == servicos.id);
    if (indexFound == -1) {
      servicosSelecionados.add(servicos);
    } else {
      servicosSelecionados.removeAt(indexFound);
    }

    change(todosServicos, status: RxStatus.success());
  }

  bool isSelected(int index) {
    Servico servicos = todosServicos[index];
    int indexFound =
        servicosSelecionados.indexWhere((element) => element.id == servicos.id);
    if (indexFound >= 0) {
      return true;
    }
    return false;
  }
}
