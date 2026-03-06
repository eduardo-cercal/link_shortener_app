import 'package:dio/dio.dart';
import 'package:link_shortener_app/core/services/impls/dio_remote_datasource_service.dart';
import 'package:link_shortener_app/core/services/interfaces/remote_datasource_service.dart';

RemoteDatasourceService remoteDatasourceServiceFactory() =>
    DioRemoteDatasourceService(Dio());
