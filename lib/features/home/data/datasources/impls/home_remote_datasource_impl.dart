import 'dart:developer';

import 'package:link_shortener_app/core/services/interfaces/remote_datasource_service.dart';
import 'package:link_shortener_app/core/utils/constants.dart';
import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_remote_datasource.dart';

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final RemoteDatasourceService service;

  HomeRemoteDatasourceImpl(this.service);

  @override
  Future<Map<String, dynamic>> createAlias(Map<String, dynamic> body) async {
    try {
      final response = await service.post(path: aliasEndpoint, body: body);

      log(response.statusCode.toString());

      if (response.statusCode != createdStatusCode) {
        throw CreateFailure();
      }
      return response.data as Map<String, dynamic>;
    } on Failure {
      rethrow;
    }
  }
}
