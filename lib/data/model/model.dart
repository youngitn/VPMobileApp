import 'package:vexana/vexana.dart';

import 'item.dart';

class MyModel extends INetworkModel<MyModel>{
 List data;
 int page;
 int per_page;

 MyModel({this.data,this.page,this.per_page});

 MyModel.fromJson(Map<String, dynamic> json) {
   data = json['data'];
   page = json['page'];
   per_page = json['per_page'];

 }



  @override
  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['page'] = this.page;
    data['per_page'] = this.per_page;

    return data;
  }

 @override
 MyModel fromJson(Map<String, Object> json) {
   // this.data = json['xmdg028'];
   // this.page = json['page'];
   // this.per_page = json['per_page'];
   return  MyModel.fromJson(json);
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