import 'dart:convert';

import 'package:link_shortener_app/features/home/data/datasources/home_local_datasource.dart';
import 'package:link_shortener_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:link_shortener_app/features/home/data/models/alias_model.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDatasource local;
  final HomeRemoteDatasource remote;

  HomeRepositoryImpl({required this.local, required this.remote});

  @override
  Future<AliasEntity?> getAliasList() async {
    final response = await local.getAliasList();

    if (response == null) {
      return null;
    }
    final json = jsonDecode(response);
    return AliasModel.fromJson(json);
  }
}
