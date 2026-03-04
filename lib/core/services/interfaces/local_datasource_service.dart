abstract class LocalDatasourceService {
  Future put({required String key, required String value});

  Future read(String key);
}
