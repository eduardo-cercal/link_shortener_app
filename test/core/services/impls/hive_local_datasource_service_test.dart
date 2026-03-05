import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:link_shortener_app/core/services/impls/hive_local_datasource_service.dart';
import 'package:link_shortener_app/core/services/interfaces/local_datasource_service.dart';
import 'package:mocktail/mocktail.dart';

class MockBox extends Mock implements Box {}

void main() {
  late Box box;
  late LocalDatasourceService sut;
  late String key;
  late String value;

  setUp(() {
    box = MockBox();
    sut = HiveLocalDatasourceService(box);
    key = faker.randomGenerator.string(5);
    value = faker.randomGenerator.string(20);
  });

  group('put', () {
    test('should put de value into the correct key', () async {
      when(() => box.put(any(), any())).thenAnswer((_) async {});

      await sut.put(key: key, value: value);

      verify(() => box.put(key, value)).called(1);
    });
  });

  group('read', () {
    void mockAnswer(answer) =>
        when(() => box.get(any())).thenAnswer((_) async => answer);
    test('should return a value stored on a specific key', () async {
      mockAnswer(value);

      final result = await sut.read(key);

      expect(result, value);

      verify(() => box.get(key)).called(1);
    });

    test('should retun a null when key doest have a value on it', () async {
      mockAnswer(null);

      final result = await sut.read(key);

      expect(result, null);
    });
  });
}
