import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/core/data/response_model.dart';
import 'package:link_shortener_app/core/services/interfaces/remote_datasource_service.dart';
import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/data/datasources/impls/home_remote_datasource_impl.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';

class MockRemoteDatasouceService extends Mock
    implements RemoteDatasourceService {}

void main() {
  late RemoteDatasourceService service;
  late HomeRemoteDatasource sut;
  late Map<String, dynamic> json;
  late ResponseModel response;
  late Map<String, dynamic> body;

  ResponseModel mockResponse() => ResponseModel(statusCode: 200, data: json);

  setUp(() {
    service = MockRemoteDatasouceService();
    sut = HomeRemoteDatasourceImpl(service);
    json = mockJson();
    response = mockResponse();
    body = mockBody();
  });

  group('create alias', () {
    When mockWhen() => when(
      () => service.post(
        path: any(named: 'path'),
        body: any(named: 'body'),
      ),
    );
    test('should return a Json when create a alias', () async {
      mockWhen().thenAnswer((_) async => response);

      final result = await sut.createAlias(body);

      expect(result, json);

      verify(() => service.post(path: 'api/alias', body: body)).called(1);
    });

    test(
      'should throw a CreateFailure when recieve a status code different of 201',
      () {
        mockWhen().thenAnswer(
          (_) async => ResponseModel(statusCode: 500, data: null),
        );

        final fail = sut.createAlias(body);

        expect(fail, throwsA(isA<CreateFailure>()));
      },
    );

    test(
      'should throw a CreateFailure when recieve a status code different of 201',
      () {
        mockWhen().thenThrow(GenericFailure());

        final fail = sut.createAlias(body);

        expect(fail, throwsA(isA<GenericFailure>()));
      },
    );
  });
}
