class TourDetailDto {
  TourDetailDto({
      this.contentid, 
      this.contenttypeid, 
      this.title, 
      this.createdtime, 
      this.modifiedtime, 
      this.tel, 
      this.telname, 
      this.homepage, 
      this.booktour, 
      this.firstimage, 
      this.firstimage2,
      this.cpyrhtDivCd, 
      this.areacode, 
      this.sigungucode, 
      this.cat1, 
      this.cat2, 
      this.cat3, 
      this.addr1, 
      this.addr2, 
      this.zipcode, 
      this.mapx, 
      this.mapy, 
      this.mlevel, 
      this.overview,});

  TourDetailDto.fromJson(dynamic json) {
    contentid = json['contentid'];
    contenttypeid = json['contenttypeid'];
    title = json['title'];
    createdtime = json['createdtime'];
    modifiedtime = json['modifiedtime'];
    tel = json['tel'];
    telname = json['telname'];
    homepage = json['homepage'];
    booktour = json['booktour'];
    firstimage = json['firstimage'];
    firstimage2 = json['firstimage2'];
    cpyrhtDivCd = json['cpyrhtDivCd'];
    areacode = json['areacode'];
    sigungucode = json['sigungucode'];
    cat1 = json['cat1'];
    cat2 = json['cat2'];
    cat3 = json['cat3'];
    addr1 = json['addr1'];
    addr2 = json['addr2'];
    zipcode = json['zipcode'];
    mapx = json['mapx'];
    mapy = json['mapy'];
    mlevel = json['mlevel'];
    overview = json['overview'];
  }
  String? contentid;
  String? contenttypeid;
  String? title;
  String? createdtime;
  String? modifiedtime;
  String? tel;
  String? telname;
  String? homepage;
  String? booktour;
  String? firstimage;
  String? firstimage2;
  String? cpyrhtDivCd;
  String? areacode;
  String? sigungucode;
  String? cat1;
  String? cat2;
  String? cat3;
  String? addr1;
  String? addr2;
  String? zipcode;
  String? mapx;
  String? mapy;
  String? mlevel;
  String? overview;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contentid'] = contentid;
    map['contenttypeid'] = contenttypeid;
    map['title'] = title;
    map['createdtime'] = createdtime;
    map['modifiedtime'] = modifiedtime;
    map['tel'] = tel;
    map['telname'] = telname;
    map['homepage'] = homepage;
    map['booktour'] = booktour;
    map['firstimage'] = firstimage;
    map['firstimage2'] = firstimage2;
    map['cpyrhtDivCd'] = cpyrhtDivCd;
    map['areacode'] = areacode;
    map['sigungucode'] = sigungucode;
    map['cat1'] = cat1;
    map['cat2'] = cat2;
    map['cat3'] = cat3;
    map['addr1'] = addr1;
    map['addr2'] = addr2;
    map['zipcode'] = zipcode;
    map['mapx'] = mapx;
    map['mapy'] = mapy;
    map['mlevel'] = mlevel;
    map['overview'] = overview;
    return map;
  }

}