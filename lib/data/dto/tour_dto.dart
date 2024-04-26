class TourDto {
  TourDto({
      this.addr1, 
      this.addr2, 
      this.areacode, 
      this.booktour, 
      this.cat1, 
      this.cat2, 
      this.cat3, 
      this.contentid, 
      this.contenttypeid, 
      this.createdtime, 
      this.firstimage, 
      this.firstimage2, 
      this.cpyrhtDivCd, 
      this.mapx, 
      this.mapy, 
      this.mlevel, 
      this.modifiedtime, 
      this.sigungucode, 
      this.tel, 
      this.title, 
      this.zipcode,});

  TourDto.fromJson(dynamic json) {
    addr1 = json['addr1'];
    addr2 = json['addr2'];
    areacode = json['areacode'];
    booktour = json['booktour'];
    cat1 = json['cat1'];
    cat2 = json['cat2'];
    cat3 = json['cat3'];
    contentid = json['contentid'];
    contenttypeid = json['contenttypeid'];
    createdtime = json['createdtime'];
    firstimage = json['firstimage'];
    firstimage2 = json['firstimage2'];
    cpyrhtDivCd = json['cpyrhtDivCd'];
    mapx = json['mapx'];
    mapy = json['mapy'];
    mlevel = json['mlevel'];
    modifiedtime = json['modifiedtime'];
    sigungucode = json['sigungucode'];
    tel = json['tel'];
    title = json['title'];
    zipcode = json['zipcode'];
  }
  String? addr1;
  String? addr2;
  String? areacode;
  String? booktour;
  String? cat1;
  String? cat2;
  String? cat3;
  String? contentid;
  String? contenttypeid;
  String? createdtime;
  String? firstimage;
  String? firstimage2;
  String? cpyrhtDivCd;
  String? mapx;
  String? mapy;
  String? mlevel;
  String? modifiedtime;
  String? sigungucode;
  String? tel;
  String? title;
  String? zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addr1'] = addr1;
    map['addr2'] = addr2;
    map['areacode'] = areacode;
    map['booktour'] = booktour;
    map['cat1'] = cat1;
    map['cat2'] = cat2;
    map['cat3'] = cat3;
    map['contentid'] = contentid;
    map['contenttypeid'] = contenttypeid;
    map['createdtime'] = createdtime;
    map['firstimage'] = firstimage;
    map['firstimage2'] = firstimage2;
    map['cpyrhtDivCd'] = cpyrhtDivCd;
    map['mapx'] = mapx;
    map['mapy'] = mapy;
    map['mlevel'] = mlevel;
    map['modifiedtime'] = modifiedtime;
    map['sigungucode'] = sigungucode;
    map['tel'] = tel;
    map['title'] = title;
    map['zipcode'] = zipcode;
    return map;
  }

}