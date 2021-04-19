import 'package:vexana/vexana.dart';

class Item extends INetworkModel<Item>{
  List pmaal004;
  int xmdg002;
  int imaal003;

  Item({this.pmaal004,this.xmdg002,this.imaal003});

  Item.fromJson(Map<String, dynamic> json) {
    pmaal004 = json['pmaal004'];
    xmdg002 = json['xmdg002'];
    imaal003 = json['imaal003'];

  }



  @override
  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pmaal004'] = this.pmaal004;
    data['xmdg002'] = this.xmdg002;
    data['imaal003'] = this.imaal003;

    return data;
  }

  @override
  Item fromJson(Map<String, Object> json) {
    // this.data = json['xmdg028'];
    // this.page = json['page'];
    // this.per_page = json['per_page'];
    return  Item.fromJson(json);
  }
// String xmdg028;
// String xmdg002;
// String imaal003;
//
// MyModel({ xmdg028, xmdg002, imaal003});
//
// MyModel.fromJson(Map<String, dynamic> json){
//     this.xmdg028 = json['xmdg028'];
//     this.xmdg002 = json['xmdg002'];
//     this.imaal003 = json['imaal003'];
// }
//
//
//
// Map<String, dynamic> toJson(){
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['xmdg028'] = this.xmdg028;
//   data['xmdg002'] = this.xmdg002;
//   data['imaal003'] = this.imaal003;
//   return data;
// }
//
// @override
// fromJson(Map<String, Object> json) {
//
//   return MyModel.fromJson(json);
// }
}