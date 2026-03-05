import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_local_datasource.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_remote_datasource.dart';
import 'package:link_shortener_app/features/home/data/home_repository_impl.dart';
import 'package:link_shortener_app/features/home/data/models/alias_model.dart';
import 'package:link_shortener_app/features/home/data/models/url_model.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

class MockHomeLocalDatasource extends Mock implements HomeLocalDatasource {}

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

void main() {
  late HomeLocalDatasource local;
  late HomeRemoteDatasource remote;
  late HomeRepository sut;

  setUp(() {
    local = MockHomeLocalDatasource();
    remote = MockHomeRemoteDatasource();
    sut = HomeRepositoryImpl(local: local, remote: remote);
  });

  group('get alias list', () {
    late List<AliasModel> modelList;
    late List<Map<String, dynamic>> jsonList;

    List<AliasModel> mockModelList() =>
        jsonList.map((json) => AliasModel.fromJson(json)).toList();

    setUp(() {
      jsonList = mockJsonList();
      modelList = mockModelList();
    });
    mockAnswer(expected) =>
        when(() => local.getAliasList()).thenAnswer((_) async => expected);
    test(
      'Should recieve a Map from Datasource and return a model to usecase',
      () async {
        mockAnswer(jsonList);

        final result = await sut.getAliasList();

        expect(result, modelList);
      },
    );

    test('should return nulll when Datasooource return null as well', () async {
      mockAnswer(null);

      final result = await sut.getAliasList();

      expect(result, null);
    });
  });

  group('save alias list', () {
    late List<AliasEntity> entityList;
    late List<Map<String, dynamic>> jsonList;

    List<Map<String, dynamic>> mockJsonList() => entityList
        .map((entity) => AliasModel.fromEntity(entity).toJson())
        .toList();

    setUp(() {
      entityList = mockEntityList();
      jsonList = mockJsonList();
      registerFallbackValue(jsonList);
    });
    test('should send a AliasModel when recieve a AliasEntity', () async {
      when(() => local.saveAliasList(any())).thenAnswer((_) async {});

      await sut.saveAliasList(entityList);

      verify(() => local.saveAliasList(jsonList)).called(1);
    });
  });

  group('create alias', () {
    late AliasModel alias;
    late Map<String, dynamic> json;
    late UrlModel url;
    late Map<String, dynamic> body;

    AliasModel mockAlias() => AliasModel.fromJson(json);

    UrlModel mockUrl() => UrlModel(faker.internet.httpsUrl());

    Map<String, dynamic> mockBody() => url.toJson();

    setUp(() {
      json = mockJson();
      alias = mockAlias();
      url = mockUrl();
      body = mockBody();
    });

    test('should return a Alias Model when sended a Url Model', () async {
      when(() => remote.createAlias(any())).thenAnswer((_) async => json);

      final result = await sut.createAlias(url);

      expect(result, alias);

      verify(() => remote.createAlias(body)).called(1);
    });

    test('should rethrow any Failure throwed from datasource', () {
      when(() => remote.createAlias(any())).thenThrow(GenericFailure());

      final fail = sut.createAlias(url);

      expect(fail, throwsA(TypeMatcher<Failure>()));
    });
  });
}
