import 'package:kovel_app/data/dto/content_detail_dto.dart';
import 'package:kovel_app/domain/model/category/content_type.dart';
import 'package:kovel_app/domain/model/detail/unified_detail.dart';

import '../../core/utils/html_util.dart';

extension ToUnifiedDetail on ContentDetailDto {
  UnifiedDetail toUnifiedDetail() {
    return UnifiedDetail(
      contentId: int.tryParse(contentid!) ?? 0,
      contentType: ContentType(contentTypeId: int.tryParse(contenttypeid!) ?? 0),
      takeTime: taketime ?? '',
      distance: distance ?? '',
      infoCenter: infocenterculture ??
          placeinfo ??
          infocenterleports ??
          infocenterlodging ??
          infocenterfood ??
          infocentershopping ??
          infocenter ??
          '',
      useFee: usefee ?? usetimefestival ?? '',
      useTime: HtmlUtil().removeHtmlTags(usetime ?? ''),
      restDay: restdateculture ??
          restdateleports ??
          restdatefood ??
          restdateshopping ??
          restdate ??
          '',
      parking: parking ?? parkingleports ?? parkingfood ?? parking ?? '',
      spendTime: spendtime ?? '',
      petAllowed: chkpetculture ?? '',
      startDate: eventstartdate ?? '',
      endDate: eventenddate ?? '',
      playTime: playtime ?? '',
      sponsor: sponsor1 ?? '',
      sponsorTel: sponsor1tel ?? '',
      homePage: eventhomepage ?? '',
      ageLimit: agelimit ?? expagerangeleports ?? '',
      placeInfo: placeinfo ?? '',
      reservationUrl: HtmlUtil().removeHtmlTags(reservationurl ?? ''),
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
      firstMenu: firstmenu ?? '',
      treatMenu: treatmenu ?? '',
      openTime: opentimefood ?? opentime ?? '',
      saleItem: saleitem ?? '',
      saleItemCost: saleitemcost ?? '',
      scale: scaleshopping ?? '',
      creditCard: chkcreditcardshopping ?? '',
      expGuide: expguide ?? '',
    );
  }
}
