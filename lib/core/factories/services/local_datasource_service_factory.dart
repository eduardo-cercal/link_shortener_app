import 'package:hive_ce/hive_ce.dart';
import 'package:link_shortener_app/core/services/impls/hive_local_datasource_service.dart';
import 'package:link_shortener_app/core/services/interfaces/local_datasource_service.dart';
import 'package:link_shortener_app/core/utils/constants.dart';

LocalDatasourceService localDatasourceServiceFactory() =>
    HiveLocalDatasourceService(Hive.box(databaseOffName));
