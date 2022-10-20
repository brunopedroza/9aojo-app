import 'dart:convert';
import 'dart:io';

import 'package:abctechapp/model/servico.dart';
import 'package:abctechapp/provider/servico_provider.dart';
import 'package:abctechapp/services/servico_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'servico_service_test.mocks.dart';

@GenerateMocks([ServicoProviderInterface])
void main() {
  late ServicoService service;
  late MockServicoProviderInterface provider;

  setUp(() async {
    provider = MockServicoProviderInterface();
    service = ServicoService(servicoProvider: provider);

    String json =
        File('${Directory.current.path}/test/resources/servico_response.json')
            .readAsStringSync();
    when(provider.getServicos()).thenAnswer((_) async => Future.sync(
        () => Response(statusCode: HttpStatus.ok, body: jsonDecode(json))));
  });

  test('Testando o retorno da API do body Json com sucesso', () async {
    List<Servico> lista = await service.getServicos();
    expect(lista.length, 6);
    expect(lista[0].id, 1);
  });
}
