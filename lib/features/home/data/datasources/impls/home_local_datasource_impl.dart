import 'dart:convert';

import 'package:link_shortener_app/core/services/interfaces/local_datasource_service.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_local_datasource.dart';
import 'package:link_shortener_app/features/home/utils/mapper.dart';

class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  final LocalDatasourceService service;

  HomeLocalDatasourceImpl(this.service);

  @override
  Future<List<Map<String, dynamic>>?> getAliasList() async {
    final result = await service.read(HomeMapper.aliasList);

    return result != null
        ? jsonDecode(result)
              .map<Map<String, dynamic>>(
                (element) => element as Map<String, dynamic>,
              )
              .toList()
        : result;
  }

  @override
  Future<void> saveAliasList(List<Map<String, dynamic>> list) async =>
      await service.put(key: HomeMapper.aliasList, value: jsonEncode(list));
}
