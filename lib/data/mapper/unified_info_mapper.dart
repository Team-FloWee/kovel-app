import 'package:kovel_app/core/utils/html_util.dart';
import 'package:kovel_app/data/dto/content_detail_info_dto.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/domain/model/detail/unified_info.dart';

extension ToUnifiedInfo on ContentDetailInfoDto {
  UnifiedInfo toUnifiedInfo() {
    return UnifiedInfo(
      contentId: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      subContentId: int.tryParse(subcontentid ?? '0') ?? 0,
      name: subname ?? '',
      overview: subdetailoverview ?? '',
      imagePath: subdetailimg ?? '',
      infoName: infoname ?? '',
      infoText: HtmlUtil().removeHtmlTags(infotext ?? ''),
    );
  }
}
