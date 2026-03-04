import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/features/home/data/datasources/home_local_datasource.dart';
import 'package:link_shortener_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:link_shortener_app/features/home/data/home_repository_impl.dart';
import 'package:link_shortener_app/features/home/data/models/alias_model.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeLocalDatasource extends Mock implements HomeLocalDatasource {}

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

void main() {
  late HomeLocalDatasource local;
  late HomeRemoteDatasource remote;
  late HomeRepository repository;
  late AliasModel model;
  late Map<String, dynamic> json;
  late String encodedJson;

  Map<String, dynamic> mockJson() => {
    'alias': faker.internet.httpsUrl(),
    '_links': {
      'short': faker.internet.httpsUrl(),
      'self': faker.internet.httpsUrl(),
    },
  };

  AliasModel mockModel() => AliasModel.fromJson(json);

  setUp(() {
    local = MockHomeLocalDatasource();
    remote = MockHomeRemoteDatasource();
    repository = HomeRepositoryImpl(local: local, remote: remote);
    model = mockModel();
    json = mockJson();
    encodedJson = jsonEncode(json);
  });

  group('get alias list', () {});
}
