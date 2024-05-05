import 'package:kovel_app/core/utils/html_util.dart';
import 'package:kovel_app/data/dto/content_detail_info_dto.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail_info.dart';
import 'package:kovel_app/domain/model/detail/festival/festival_detail_info.dart';
import 'package:kovel_app/domain/model/detail/leports/leports_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tourist_spot/tourist_spot_detail_info.dart';

extension ToContentDetailInfo on ContentDetailInfoDto {
  CourseDetailInfo toCourseDetailInfo() {
    return CourseDetailInfo(
      contentId: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      subContentId: int.tryParse(subcontentid!) ?? 0,
      name: subname ?? '',
      overview: subdetailoverview ?? '',
      imagePath: subdetailimg ?? '',
    );
  }

  CultureLocationDetailInfo toCultureLocationDeteailInfo() {
    return CultureLocationDetailInfo(
      contentId: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      infoName: infoname ?? '',
      infoText: HtmlUtil().removeHtmlTags(infotext ?? ''),
    );
  }

  FestivalDetailInfo toFestivalDetailInfo() {
    return FestivalDetailInfo(
      contentId: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      infoName: infoname ?? '',
      infoText: HtmlUtil().removeHtmlTags(infotext ?? ''),
    );
  }

  LeportsDetailInfo toLeportsDetailInfo() {
    return LeportsDetailInfo(
      contentId: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      infoName: infoname ?? '',
      infoText: HtmlUtil().removeHtmlTags(infotext ?? ''),
    );
  }

  TouristSpotDetailInfo toTouristSpotDetailInfo() {
    return TouristSpotDetailInfo(
      contentId: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      infoName: infoname ?? '',
      infoText: HtmlUtil().removeHtmlTags(infotext ?? ''),
    );
  }
}
