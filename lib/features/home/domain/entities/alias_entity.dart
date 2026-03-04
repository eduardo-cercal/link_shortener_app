import 'package:equatable/equatable.dart';
import 'package:link_shortener_app/features/home/domain/entities/link_entity.dart';

class AliasEntity extends Equatable {
  final String alias;
  final LinkEntity link;

  const AliasEntity({required this.alias, required this.link});

  @override
  List<Object?> get props => [alias, link];
}
