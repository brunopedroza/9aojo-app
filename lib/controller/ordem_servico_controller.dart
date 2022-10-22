import 'dart:developer';

import 'package:abctechapp/model/ordemservico_criada.dart';
import 'package:abctechapp/model/servico.dart';
import 'package:abctechapp/services/geolocation_service.dart';
import 'package:abctechapp/services/ordemservico_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../model/ordemservico.dart';
import '../model/ordemservico_location.dart';

enum OrdemServicoState { criando, iniciada, finalizada }

class OrdemServicoController extends GetxController
    with StateMixin<OrdemServicoCriada> {
  final GeolocationServiceInterface _geolocationService;
  final OrdemServicoService _ordemservicoservice;
  final formKey = GlobalKey<FormState>();
  final idPrestadorController = TextEditingController();
  final servicosSelecionados = <Servico>[].obs;
  final screenState = OrdemServicoState.criando.obs;
  late OrdemServico _ordemservico;

  OrdemServicoController(this._geolocationService, this._ordemservicoservice);

  @override
  void onInit() {
    super.onInit();
    _geolocationService.start();
    change(null, status: RxStatus.success());
  }

  OrdemServicoLocation ordemServicoLocationFromPosition(Position position) {
    return OrdemServicoLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        dataHora: DateTime.now());
  }

  List<int> idServicosArrayFromServices() {
    return servicosSelecionados.map((element) => element.id).toList();
  }

  finishStartOrdemServico() {
    if ((servicosSelecionados.isNotEmpty) &&
        (idPrestadorController.text != "")) {
      switch (screenState.value) {
        case OrdemServicoState.criando:
          _geolocationService.getPosition().then((value) {
            var start = ordemServicoLocationFromPosition(value);

            _ordemservico = OrdemServico(
                idPrestador: int.parse(idPrestadorController.text),
                servicos: idServicosArrayFromServices(),
                inicioAtendimento: start,
                fimAtendimento: null);
          });
          screenState.value = OrdemServicoState.iniciada;
          break;
        case OrdemServicoState.iniciada:
          change(null, status: RxStatus.loading());
          _geolocationService.getPosition().then((value) {
            var fimAtendimento = ordemServicoLocationFromPosition(value);

            _ordemservico.fimAtendimento = fimAtendimento;
            _createOrdemServico();
          });

          break;
        default:
      }
    } else {
      Get.snackbar("Atenção!",
          "Insira o código do prestador e selecione ao menos um serviço");
    }
  }

  void _createOrdemServico() {
    screenState.value = OrdemServicoState.finalizada;
    _ordemservicoservice.criarOrdemServico(_ordemservico).then((value) {
      if (value.success) {
        Get.snackbar(
            "Sucesso", "A sua Ordem de serviço foi criada com sucesso");
        clearForm();
      }
    }).catchError((error) {
      Get.snackbar("Erro", error.toString());
    });
  }

  void clearForm() {
    screenState.value = OrdemServicoState.criando;
    servicosSelecionados.clear();
    idPrestadorController.text = "";
    change(null, status: RxStatus.success());
  }

  editServicos() {
    if (screenState.value != OrdemServicoState.criando) {
      return null;
    }
    Get.toNamed("/servico", arguments: servicosSelecionados);
  }
}
