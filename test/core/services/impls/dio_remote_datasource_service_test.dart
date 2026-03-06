import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_shortener_app/core/data/response_model.dart';
import 'package:link_shortener_app/core/services/impls/dio_remote_datasource_service.dart';
import 'package:link_shortener_app/core/services/interfaces/remote_datasource_service.dart';
import 'package:link_shortener_app/core/utils/constants.dart';
import 'package:link_shortener_app/core/utils/failure.dart';

import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dio;
  late RemoteDatasourceService sut;
  late Map<String, dynamic> json;
  late Map<String, dynamic> body;
  late ResponseModel model;

  ResponseModel mockResponse() => ResponseModel(statusCode: 201, data: json);

  setUp(() {
    dio = MockDio();
    sut = DioRemoteDatasourceService(dio);
    json = mockJson();
    body = mockBody();
    model = mockResponse();
  });

  group('post', () {
    test(
      'should return a Map when send to the correct endpoint with the currect body',
      () async {
        when(() => dio.post(any(), data: any(named: 'data'))).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(),
            statusCode: 201,
            data: json,
          ),
        );

        final result = await sut.post(path: aliasEndpoint, body: body);

        expect(result, model);

        verify(
          () => dio.post(
            'https://url-shortener-server.onrender.com/api/alias',
            data: body,
          ),
        ).called(1);
      },
    );

    test('Should throw a ServerFailure when fail to call', () {
      when(
        () => dio.post(any(), data: any(named: 'data')),
      ).thenThrow(DioException(requestOptions: RequestOptions()));

      final failure = sut.post(path: aliasEndpoint, body: body);

      expect(failure, throwsA(TypeMatcher<Failure>()));
    });
  });
}
