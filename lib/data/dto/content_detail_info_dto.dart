class ContentDetailInfoDto {
  ContentDetailInfoDto({
      this.roomimg4, 
      this.roomtoiletries, 
      this.roomsofa, 
      this.roomcook, 
      this.roomtable, 
      this.roomimg5alt, 
      this.contentid, 
      this.contenttypeid, 
      this.fldgubun, 
      this.infoname, 
      this.infotext, 
      this.serialnum, 
      this.subcontentid, 
      this.subdetailalt, 
      this.subdetailimg, 
      this.subdetailoverview, 
      this.subname, 
      this.subnum, 
      this.roomcode, 
      this.roomtitle, 
      this.roomsize1, 
      this.roomcount, 
      this.roombasecount, 
      this.roommaxcount, 
      this.roomoffseasonminfee1, 
      this.roomoffseasonminfee2, 
      this.roompeakseasonminfee1, 
      this.roompeakseasonminfee2, 
      this.roomintro, 
      this.roombathfacility, 
      this.roombath, 
      this.roomhometheater, 
      this.roomaircondition, 
      this.roomtv, 
      this.roompc, 
      this.roomcable, 
      this.roominternet, 
      this.roomrefrigerator, 
      this.roomimg5, 
      this.roomimg3, 
      this.roomimg4alt, 
      this.roomimg3alt, 
      this.roomhairdryer, 
      this.roomsize2, 
      this.roomimg2alt, 
      this.roomimg1, 
      this.roomimg1alt, 
      this.roomimg2, 
      this.cpyrhtDivCd1, 
      this.cpyrhtDivCd2, 
      this.cpyrhtDivCd3, 
      this.cpyrhtDivCd4, 
      this.cpyrhtDivCd5,});

  ContentDetailInfoDto.fromJson(dynamic json) {
    roomimg4 = json['roomimg4'];
    roomtoiletries = json['roomtoiletries'];
    roomsofa = json['roomsofa'];
    roomcook = json['roomcook'];
    roomtable = json['roomtable'];
    roomimg5alt = json['roomimg5alt'];
    contentid = json['contentid'];
    contenttypeid = json['contenttypeid'];
    fldgubun = json['fldgubun'];
    infoname = json['infoname'];
    infotext = json['infotext'];
    serialnum = json['serialnum'];
    subcontentid = json['subcontentid'];
    subdetailalt = json['subdetailalt'];
    subdetailimg = json['subdetailimg'];
    subdetailoverview = json['subdetailoverview'];
    subname = json['subname'];
    subnum = json['subnum'];
    roomcode = json['roomcode'];
    roomtitle = json['roomtitle'];
    roomsize1 = json['roomsize1'];
    roomcount = json['roomcount'];
    roombasecount = json['roombasecount'];
    roommaxcount = json['roommaxcount'];
    roomoffseasonminfee1 = json['roomoffseasonminfee1'];
    roomoffseasonminfee2 = json['roomoffseasonminfee2'];
    roompeakseasonminfee1 = json['roompeakseasonminfee1'];
    roompeakseasonminfee2 = json['roompeakseasonminfee2'];
    roomintro = json['roomintro'];
    roombathfacility = json['roombathfacility'];
    roombath = json['roombath'];
    roomhometheater = json['roomhometheater'];
    roomaircondition = json['roomaircondition'];
    roomtv = json['roomtv'];
    roompc = json['roompc'];
    roomcable = json['roomcable'];
    roominternet = json['roominternet'];
    roomrefrigerator = json['roomrefrigerator'];
    roomimg5 = json['roomimg5'];
    roomimg3 = json['roomimg3'];
    roomimg4alt = json['roomimg4alt'];
    roomimg3alt = json['roomimg3alt'];
    roomhairdryer = json['roomhairdryer'];
    roomsize2 = json['roomsize2'];
    roomimg2alt = json['roomimg2alt'];
    roomimg1 = json['roomimg1'];
    roomimg1alt = json['roomimg1alt'];
    roomimg2 = json['roomimg2'];
    cpyrhtDivCd1 = json['cpyrhtDivCd1'];
    cpyrhtDivCd2 = json['cpyrhtDivCd2'];
    cpyrhtDivCd3 = json['cpyrhtDivCd3'];
    cpyrhtDivCd4 = json['cpyrhtDivCd4'];
    cpyrhtDivCd5 = json['cpyrhtDivCd5'];
  }
  String? roomimg4;
  String? roomtoiletries;
  String? roomsofa;
  String? roomcook;
  String? roomtable;
  String? roomimg5alt;
  String? contentid;
  String? contenttypeid;
  String? fldgubun;
  String? infoname;
  String? infotext;
  String? serialnum;
  String? subcontentid;
  String? subdetailalt;
  String? subdetailimg;
  String? subdetailoverview;
  String? subname;
  String? subnum;
  String? roomcode;
  String? roomtitle;
  String? roomsize1;
  String? roomcount;
  String? roombasecount;
  String? roommaxcount;
  String? roomoffseasonminfee1;
  String? roomoffseasonminfee2;
  String? roompeakseasonminfee1;
  String? roompeakseasonminfee2;
  String? roomintro;
  String? roombathfacility;
  String? roombath;
  String? roomhometheater;
  String? roomaircondition;
  String? roomtv;
  String? roompc;
  String? roomcable;
  String? roominternet;
  String? roomrefrigerator;
  String? roomimg5;
  String? roomimg3;
  String? roomimg4alt;
  String? roomimg3alt;
  String? roomhairdryer;
  String? roomsize2;
  String? roomimg2alt;
  String? roomimg1;
  String? roomimg1alt;
  String? roomimg2;
  String? cpyrhtDivCd1;
  String? cpyrhtDivCd2;
  String? cpyrhtDivCd3;
  String? cpyrhtDivCd4;
  String? cpyrhtDivCd5;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['roomimg4'] = roomimg4;
    map['roomtoiletries'] = roomtoiletries;
    map['roomsofa'] = roomsofa;
    map['roomcook'] = roomcook;
    map['roomtable'] = roomtable;
    map['roomimg5alt'] = roomimg5alt;
    map['contentid'] = contentid;
    map['contenttypeid'] = contenttypeid;
    map['fldgubun'] = fldgubun;
    map['infoname'] = infoname;
    map['infotext'] = infotext;
    map['serialnum'] = serialnum;
    map['subcontentid'] = subcontentid;
    map['subdetailalt'] = subdetailalt;
    map['subdetailimg'] = subdetailimg;
    map['subdetailoverview'] = subdetailoverview;
    map['subname'] = subname;
    map['subnum'] = subnum;
    map['roomcode'] = roomcode;
    map['roomtitle'] = roomtitle;
    map['roomsize1'] = roomsize1;
    map['roomcount'] = roomcount;
    map['roombasecount'] = roombasecount;
    map['roommaxcount'] = roommaxcount;
    map['roomoffseasonminfee1'] = roomoffseasonminfee1;
    map['roomoffseasonminfee2'] = roomoffseasonminfee2;
    map['roompeakseasonminfee1'] = roompeakseasonminfee1;
    map['roompeakseasonminfee2'] = roompeakseasonminfee2;
    map['roomintro'] = roomintro;
    map['roombathfacility'] = roombathfacility;
    map['roombath'] = roombath;
    map['roomhometheater'] = roomhometheater;
    map['roomaircondition'] = roomaircondition;
    map['roomtv'] = roomtv;
    map['roompc'] = roompc;
    map['roomcable'] = roomcable;
    map['roominternet'] = roominternet;
    map['roomrefrigerator'] = roomrefrigerator;
    map['roomimg5'] = roomimg5;
    map['roomimg3'] = roomimg3;
    map['roomimg4alt'] = roomimg4alt;
    map['roomimg3alt'] = roomimg3alt;
    map['roomhairdryer'] = roomhairdryer;
    map['roomsize2'] = roomsize2;
    map['roomimg2alt'] = roomimg2alt;
    map['roomimg1'] = roomimg1;
    map['roomimg1alt'] = roomimg1alt;
    map['roomimg2'] = roomimg2;
    map['cpyrhtDivCd1'] = cpyrhtDivCd1;
    map['cpyrhtDivCd2'] = cpyrhtDivCd2;
    map['cpyrhtDivCd3'] = cpyrhtDivCd3;
    map['cpyrhtDivCd4'] = cpyrhtDivCd4;
    map['cpyrhtDivCd5'] = cpyrhtDivCd5;
    return map;
  }

}