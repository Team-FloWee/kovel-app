import 'package:kovel_app/data/dto/tour_dto.dart';
import 'package:kovel_app/domain/model/category/category_type.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/domain/model/category/course_category_type.dart';
import 'package:kovel_app/domain/model/category/dummy_category_type.dart';
import 'package:kovel_app/domain/model/tour.dart';

extension ToTour on TourDto {
  Tour toTour() {
    return Tour(
      id: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      title: title ?? '',
      address1: addr1 ?? '',
      address2: addr2 ?? '',
      zipCode: zipcode ?? '',
      areaCode: areacode ?? '',
      category1: cat1 ?? '',
      category2: cat2 ?? '',
      category3: cat3 ?? '',
      categoryType: _getCategoryType(),
      createdTime: createdtime ?? '',
      mapx: mapx ?? '',
      mapy: mapy ?? '',
      imagePath: firstimage ?? '',
      tel: tel ?? '',
    );
  }

  CategoryType _getCategoryType() {
    if (contenttypeid == '25') {
      return CourseCategoryType(courseCategoryId: cat2 ?? '');
    } else {
      return DummyCategoryType(id: '');
    }
  }
}
