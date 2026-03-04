import 'package:link_shortener_app/features/home/domain/entities/link_entity.dart';
import 'package:link_shortener_app/features/home/utils/mapper.dart';

class LinkModel extends LinkEntity {
  const LinkModel({required super.short, required super.self});

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      LinkModel(self: json[HomeMapper.self], short: json[HomeMapper.short]);

  factory LinkModel.fromEntity(LinkEntity entity) =>
      LinkModel(self: entity.self, short: entity.short);

  Map<String, dynamic> toJson() => {
    HomeMapper.self: self,
    HomeMapper.short: short,
  };
}
