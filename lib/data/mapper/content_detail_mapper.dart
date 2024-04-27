import 'package:kovel_app/data/dto/content_detail_dto.dart';
import 'package:kovel_app/domain/model/detail/course/course_detail.dart';
import 'package:kovel_app/domain/model/detail/culture_location/culture_location_detail.dart';
import 'package:kovel_app/domain/model/detail/festival/festival_detail.dart';
import 'package:kovel_app/domain/model/detail/leports/leports_detail.dart';
import 'package:kovel_app/domain/model/detail/lodgment/lodgment_detail.dart';
import 'package:kovel_app/domain/model/detail/restaurant/restaurant_detail.dart';
import 'package:kovel_app/domain/model/detail/shopping/shopping_detail.dart';
import 'package:kovel_app/domain/model/detail/tourist_spot/tourist_spot_detail.dart';

extension ToContentDetail on ContentDetailDto {
  CourseDetail toCourseDetail() {
    return CourseDetail(
      takeTime: taketime ?? '',
      distance: distance ?? '',
    );
  }

  CultureLocationDetail toCultureLocationDetail() {
    return CultureLocationDetail(
      useFee: usefee ?? '',
      useTime: usetime ?? '',
      restDay: restdateculture ?? '',
      parking: parking ?? '',
      spendTime: spendtime ?? '',
      petAllowed: chkpetculture ?? '',
    );
  }

  FestivalDetail toFestivalDetail() {
    return FestivalDetail(
      startDate: eventstartdate ?? '',
      endDate: eventenddate ?? '',
      playTime: playtime ?? '',
      sponsor: sponsor1 ?? '',
      sponsorTel: sponsor1tel ?? '',
      homePage: eventhomepage ?? '',
      ageLimit: agelimit ?? '',
      placeInfo: placeinfo ?? '',
      useFee: usetimefestival ?? '',
    );
  }

  LeportsDetail toLeportsDetail() {
    return LeportsDetail(
      restDay: restdateleports ?? '',
      useTime: usetimeleports ?? '',
      ageLimit: expagerangeleports ?? '',
      parking: parkingleports ?? '',
    );
  }

  LodgmentDetail toLodgmentDetail() {
    return LodgmentDetail(
      reservationUrl: reservationurl ?? '',
      roomCount: roomcount ?? '',
      isGoodStay: goodstay == "1" ? true : false,
      isBenikia: benikia == "1" ? true : false,
      isHanok: hanok == "1" ? true : false,
      hasSeminar: seminar == "1" ? true : false,
      hasSports: sports == "1" ? true : false,
      hasSauna: sauna == "1" ? true : false,
      hasBeauty: beauty == "1" ? true : false,
      hasBeverage: beverage == "1" ? true : false,
      hasKaraoke: karaoke == "1" ? true : false,
      hasBarbecue: barbecue == "1" ? true : false,
      hasCampfire: campfire == "1" ? true : false,
      hasBicycle: bicycle == "1" ? true : false,
      hasFitness: fitness == "1" ? true : false,
      hasPublicPc: publicpc == "1" ? true : false,
      hasPublicBath: publicbath == "1" ? true : false,
      pickup: pickup ?? '',
      park: parkinglodging ?? '',
      subFacility: subfacility ?? '',
      foodPlace: foodplace ?? '',
    );
  }

  RestaurantDetail toRestaurantDetail() {
    return RestaurantDetail(
      firstMenu: firstmenu ?? '',
      treatMenu: treatmenu ?? '',
      parking: parkingfood ?? '',
      openTime: opentimefood ?? '',
      restDay: restdatefood ?? '',
    );
  }

  ShoppingDetail toShoppingDetail() {
    return ShoppingDetail(
      saleItem: saleitem ?? '',
      saleItemCost: saleitemcost ?? '',
      restDay: restdateshopping ?? '',
      scale: scaleshopping ?? '',
      creditCard: chkcreditcardshopping ?? '',
      openTime: opentime ?? '',
    );
  }

  TouristSpotDetail toTouristSpotDetail() {
    return TouristSpotDetail(
      expGuide: expguide ?? '',
      parking: parking ?? '',
      restDay: restdate ?? '',
      useTime: usetime ?? '',
    );
  }
}
