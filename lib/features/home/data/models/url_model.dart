import 'package:link_shortener_app/features/home/domain/entities/url_entity.dart';
import 'package:link_shortener_app/features/home/utils/mapper.dart';

class UrlModel extends UrlEntity {
  const UrlModel(super.url);

  factory UrlModel.fromEntity(UrlEntity entity) => UrlModel(entity.url);

  Map<String, dynamic> toJson() => {HomeMapper.url: url};
}
