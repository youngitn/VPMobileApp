
import 'package:vexana/vexana.dart';


class WorkOrderInfo extends INetworkModel<WorkOrderInfo> {
  String imaal003;
  String sfba013;
  String sfbaseq;
  String sfba014;
  String sfba016;
  String sfba005;


  WorkOrderInfo(
      {this.imaal003, this.sfba013, this.sfbaseq, this.sfba014, this.sfba005});

  WorkOrderInfo.fromJson(Map<String, dynamic> json) {

    imaal003 = json['imaal003'];
    sfba013 = json['sfba013'];
    sfbaseq = json['sfbaseq'];
    sfba014 = json['sfba014'];
    sfba016 = json['sfba016'];
    sfba005 = json['sfba005'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imaal003'] = this.imaal003;
    data['sfba013'] = this.sfba013;
    data['sfbaseq'] = this.sfbaseq;
    data['sfba014'] = this.sfba014;
    data['sfba005'] = this.sfba005;
    data['sfba016'] = this.sfba016;

    return data;
  }

  @override
  WorkOrderInfo fromJson(Map<String, Object> json) => WorkOrderInfo.fromJson(json);
}