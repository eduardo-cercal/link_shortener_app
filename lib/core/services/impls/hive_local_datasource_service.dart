import 'package:hive_ce/hive_ce.dart';
import 'package:link_shortener_app/core/services/interfaces/local_datasource_service.dart';

class HiveLocalDatasourceService implements LocalDatasourceService {
  final Box box;

  HiveLocalDatasourceService(this.box);

  @override
  Future<dynamic> put({required String key, required String value}) async =>
      await box.put(key, value);

  @override
  Future<dynamic> read(String key) async => await box.get(key);
}
