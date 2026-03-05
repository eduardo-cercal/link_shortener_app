import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/core/services/interfaces/local_datasource_service.dart';
import 'package:link_shortener_app/features/home/data/datasources/impls/home_local_datasource_impl.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_local_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';

class MockLocalDatasourceService extends Mock
    implements LocalDatasourceService {}

void main() {
  late LocalDatasourceService service;
  late HomeLocalDatasource sut;
  late List<Map<String, dynamic>> jsonList;
  late String jsonEncoded;

  setUp(() {
    service = MockLocalDatasourceService();
    sut = HomeLocalDatasourceImpl(service);
    jsonList = mockJsonList();
    jsonEncoded = jsonEncode(jsonList);
  });

  group('get alias list', () {
    void mockAnswer(answer) =>
        when(() => service.read(any())).thenAnswer((_) async => answer);

    test('should return a Map when recieve a String from service', () async {
      mockAnswer(jsonEncoded);

      final result = await sut.getAliasList();

      expect(result, jsonList);

      verify(() => service.read('alias_list')).called(1);
    });

    test('should return null when recieve null', () async {
      mockAnswer(null);

      final result = await sut.getAliasList();

      expect(result, null);
    });
  });

  group('save alias list', () {
    test('should encod to string a list of map recieve', () async {
      when(
        () => service.put(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});

      await sut.saveAliasList(jsonList);

      verify(
        () => service.put(key: 'alias_list', value: jsonEncoded),
      ).called(1);
    });
  });
}
