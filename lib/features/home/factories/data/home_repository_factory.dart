import 'package:link_shortener_app/features/home/data/home_repository_impl.dart';
import 'package:link_shortener_app/features/home/domain/home_repository.dart';
import 'package:link_shortener_app/features/home/factories/data/datasources/home_local_datasource_factory.dart';
import 'package:link_shortener_app/features/home/factories/data/datasources/home_remote_datasource_factory.dart';

HomeRepository homeRepositoryFactory() => HomeRepositoryImpl(
  local: homeLocalDataSourceFactory(),
  remote: homeRemoteDatasourceFactory(),
);
