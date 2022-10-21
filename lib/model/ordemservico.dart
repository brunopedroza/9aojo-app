import 'dart:convert';

import 'package:abctechapp/model/ordemservico_location.dart';

class OrdemServico {
  int idPrestador = 0;
  List<int> servicos = [];
  OrdemServicoLocation? inicioAtendimento;
  OrdemServicoLocation? fimAtendimento;
  OrdemServico(
      {required this.idPrestador,
      required this.servicos,
      required this.inicioAtendimento,
      required this.fimAtendimento});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPrestador': idPrestador,
      'servicos': servicos,
      'inicioAtendimento': inicioAtendimento?.toMap(),
      'fimAtendimento': fimAtendimento?.toMap()
    };
  }

  String toJson() => json.encode(toMap());
}
