import 'package:dio/dio.dart';
import 'package:link_shortener_app/core/data/response_model.dart';
import 'package:link_shortener_app/core/services/interfaces/remote_datasource_service.dart';
import 'package:link_shortener_app/core/utils/constants.dart';
import 'package:link_shortener_app/core/utils/failure.dart';

class DioRemoteDatasourceService implements RemoteDatasourceService {
  final Dio dio;

  DioRemoteDatasourceService(this.dio);

  @override
  Future<ResponseModel> post({required String path, required body}) async {
    try {
      final response = await dio.post(baseUrl + path, data: body);

      return ResponseModel(
        statusCode: response.statusCode ?? 500,
        data: response.data,
      );
    } on Exception {
      throw GenericFailure();
    }
  }
}
