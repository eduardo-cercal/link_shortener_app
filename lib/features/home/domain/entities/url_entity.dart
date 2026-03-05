import 'package:equatable/equatable.dart';

class UrlEntity extends Equatable {
  final String url;

  const UrlEntity(this.url);

  @override
  List<Object?> get props => [url];
}
