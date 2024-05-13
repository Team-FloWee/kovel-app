import 'package:kovel_app/domain/model/archived.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';
import 'package:kovel_app/domain/model/tour.dart';

mixin ArchivedUtil {
  static Archived getArchived({Tour? tour, TourDetail? tourDetail}) {
    return Archived(
      id: tour?.id ?? tourDetail?.contentId ?? 0,
      contentType: tour?.contentType.contentTypeId ??
          tourDetail?.contentType.contentTypeId ??
          0,
      title: tour?.title ?? tourDetail?.title ?? '',
      mapx: tour?.mapx ?? tourDetail?.mapx ?? '',
      mapy: tour?.mapy ?? tourDetail?.mapy ?? '',
      imagePath: tour?.imagePath ?? tourDetail?.imagePath ?? '',
      tel: tour?.tel ?? tourDetail?.tel ?? '',
    );
  }
}
