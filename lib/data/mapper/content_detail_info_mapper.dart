import 'package:kovel_app/data/dto/content_detail_info_dto.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail_info.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail_info.dart';
import 'package:kovel_app/domain/model/detail/festival/festival_detail_info.dart';
import 'package:kovel_app/domain/model/detail/leports/leports_detail_info.dart';
import 'package:kovel_app/domain/model/detail/tourist_spot/tourist_spot_detail_info.dart';

extension ToContentDetailInfo on ContentDetailInfoDto {
  CourseDetailInfo toCourseDetailInfo() {
    return CourseDetailInfo(
        name: subname ?? '',
        overview: subdetailoverview ?? ''
    );
  }

  CultureLocationDetailInfo toCultureLocationDeteailInfo() {
    return CultureLocationDetailInfo(
        infoName: infoname ?? '',
        infoText: infotext ?? ''
    );
  }

  FestivalDetailInfo toFestivalDeteailInfo() {
    return FestivalDetailInfo(
        infoName: infoname ?? '',
        infoText: infotext ?? ''
    );
  }

  LeportsDetailInfo toLeportsDeteailInfo() {
    return LeportsDetailInfo(
        infoName: infoname ?? '',
        infoText: infotext ?? ''
    );
  }

  TouristSpotDetailInfo toTouristSpotDeteailInfo() {
    return TouristSpotDetailInfo(
        infoName: infoname ?? '',
        infoText: infotext ?? ''
    );
  }
}