abstract class HomeLocalDatasource {
  Future<List<Map<String, dynamic>>?> getAliasList();

  Future<void> saveAliasList(List<Map<String, dynamic>> list);
}
