import 'package:vexana/vexana.dart';

class StockByLocation extends INetworkModel<StockByLocation> {
  String sfaadocno;
  String inag004;
  String inag005;
  String inag001;
  String inag008;
  String imaal003;
  String sfbaseq;
  String sfba005;
  String sfba013;
  String sfba016;
  String sfba014;
  String inaa007;

  StockByLocation(
      {this.sfaadocno,
      this.inag004,
      this.inag005,
      this.inag001,
      this.inag008,
      this.imaal003,
      this.sfbaseq,
      this.sfba005,
      this.sfba013,
      this.sfba016,
      this.sfba014,
      this.inaa007});

  StockByLocation.fromJson(Map<String, dynamic> json) {
    sfaadocno = json['sfaadocno'];
    inag001 = json['inag001'];
    inag008 = json['inag008'];
    inag004 = json['inag004'];
    inag005 = json['inag005'];
    inag001 = json['inag001'];
    imaal003 = json['imaal003'];
    sfbaseq = json['sfbaseq'];
    sfba005 = json['sfba005'];
    sfba013 = json['sfba013'];
    sfba016 = json['sfba016'];
    sfba014 = json['sfba014'];
    inaa007 = json['inaa007'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inag001'] = this.inag001;
    data['inag008'] = this.inag008;
    data['sfaadocno'] = this.sfaadocno;
    data['inag004'] = this.inag004;
    data['inag005'] = this.inag005;
    data['inag001'] = this.inag001;
    data['imaal003'] = this.imaal003;
    data['sfbaseq'] = this.sfbaseq;
    data['sfba005'] = this.sfba005;
    data['sfba013'] = this.sfba013;
    data['sfba016'] = this.sfba016;
    data['sfba014'] = this.sfba014;
    data['inaa007'] = this.inaa007;

    return data;
  }

  @override
  StockByLocation fromJson(Map<String, Object> json) =>
      StockByLocation.fromJson(json);
}
