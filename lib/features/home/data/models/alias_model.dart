import 'package:link_shortener_app/features/home/data/models/link_model.dart';
import 'package:link_shortener_app/features/home/domain/entities/alias_entity.dart';
import 'package:link_shortener_app/features/home/utils/mapper.dart';

class AliasModel extends AliasEntity {
  const AliasModel({required super.alias, required super.link});

  factory AliasModel.fromJson(Map<String, dynamic> json) =>
      AliasModel(alias: json[HomeMapper.alias], link: json[HomeMapper.links]);

  factory AliasModel.fromEntity(AliasEntity entity) =>
      AliasModel(alias: entity.alias, link: LinkModel.fromEntity(entity.link));

  Map<String, dynamic> toJson() => {
    HomeMapper.alias: alias,
    HomeMapper.links: LinkModel.fromEntity(link).toJson(),
  };
}
