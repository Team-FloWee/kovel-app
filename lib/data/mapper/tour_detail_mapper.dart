import 'package:kovel_app/data/dto/tour_detail_dto.dart';
import 'package:kovel_app/domain/model/detail/tour_detail.dart';

extension ToTourDetail on TourDetailDto {
  TourDetail toTourDetail() {
    return TourDetail(
      id: int.tryParse(contentid!) ?? 0,
      title: title ?? '',
      address1: addr1 ?? '',
      address2: addr2 ?? '',
      zipCode: zipcode ?? '',
      areaCode: areacode ?? '',
      category1: cat1 ?? '',
      category2: cat2 ?? '',
      category3: cat3 ?? '',
      contentTypeId: contenttypeid ?? '',
      createdTime: createdtime ?? '',
      mapx: mapx ?? '',
      mapy: mapy ?? '',
      imagePath: firstimage ?? '',
      tel: tel ?? '',
      telName: telname ?? '',
      overview: overview ?? '',
    );
  }
}
