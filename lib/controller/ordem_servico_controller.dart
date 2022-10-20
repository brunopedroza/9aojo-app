import 'dart:developer';

import 'package:abctechapp/model/servico.dart';
import 'package:abctechapp/services/geolocation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrdemServicoController extends GetxController {
  final GeolocationServiceInterface _geolocationService;
  final formKey = GlobalKey<FormState>();
  final idPrestadorController = TextEditingController();
  final servicosSelecionados = <Servico>[].obs;

  OrdemServicoController(this._geolocationService);

  @override
  void onInit() {
    super.onInit();
    _geolocationService.start();
  }

  getLocation() {
    _geolocationService
        .getPosition()
        .then((value) => log(value.toJson().toString()));
  }

  finishStartOrdemServico() {
    getLocation();
  }

  editServicos() {
    Get.toNamed("/servico", arguments: servicosSelecionados);
  }
}
