import 'package:link_shortener_app/core/data/response_model.dart';

abstract class RemoteDatasourceService {
  Future<ResponseModel> post({required String path, required body});
}
