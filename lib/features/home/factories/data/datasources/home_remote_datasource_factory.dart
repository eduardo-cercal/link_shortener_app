import 'package:link_shortener_app/core/factories/services/remote_datasource_service_factory.dart';
import 'package:link_shortener_app/features/home/data/datasources/impls/home_remote_datasource_impl.dart';
import 'package:link_shortener_app/features/home/data/datasources/interfaces/home_remote_datasource.dart';

HomeRemoteDatasource homeRemoteDatasourceFactory() =>
    HomeRemoteDatasourceImpl(remoteDatasourceServiceFactory());
