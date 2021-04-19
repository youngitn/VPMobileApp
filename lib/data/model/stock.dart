import 'package:vexana/vexana.dart';

class Stock extends INetworkModel<Stock> {
  String inag001;
  String inag100;


  Stock({this.inag001, this.inag100});

  Stock.fromJson(Map<String, dynamic> json) {
    inag001 = json['inag001'];
    inag100 = json['inag100'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inag001'] = this.inag001;
    data['inag100'] = this.inag100;

    return data;
  }

  @override
  Stock fromJson(Map<String, Object> json) => Stock.fromJson(json);
}

