import 'package:link_shortener_app/core/factories/services/local_datasource_service_factory.dart';
import 'package:link_shortener_app/features/home/data/datasources/impls/home_local_datasource_impl.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_local_datasource.dart';

HomeLocalDatasource homeLocalDataSourceFactory() =>
    HomeLocalDatasourceImpl(localDatasourceServiceFactory());
