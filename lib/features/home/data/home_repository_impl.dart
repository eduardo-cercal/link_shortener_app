import 'package:link_shortener_app/core/utils/failure.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_local_datasource.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_remote_datasource.dart';
import 'package:link_shortener_app/features/home/data/models/alias_model.dart';
import 'package:link_shortener_app/features/home/data/models/url_model.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/domain/entities/url_entity.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDatasource local;
  final HomeRemoteDatasource remote;

  HomeRepositoryImpl({required this.local, required this.remote});

  @override
  Future<List<AliasEntity>?> getAliasList() async {
    final response = await local.getAliasList();

    if (response == null) {
      return null;
    }
    return response
        .map<AliasModel>((json) => AliasModel.fromJson(json))
        .toList();
  }

  @override
  Future<void> saveAliasList(List<AliasEntity> list) async =>
      await local.saveAliasList(
        list.map((entity) => AliasModel.fromEntity(entity).toJson()).toList(),
      );

  @override
  Future<AliasEntity> createAlias(UrlEntity url) async {
    try {
      final result = await remote.createAlias(
        UrlModel.fromEntity(url).toJson(),
      );

      return AliasModel.fromJson(result);
    } on Failure {
      rethrow;
    }
  }
}
