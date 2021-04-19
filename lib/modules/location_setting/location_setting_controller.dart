import 'package:demo_getx/data/model/location.dart';
import 'package:demo_getx/service/location_service.dart';
import 'package:demo_getx/service/location_service_impl.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationSettingController extends GetxController {
  TextEditingController locationCodeTextController = TextEditingController();
  RxList locationList = [].obs;
  LocationService ls = Get.put(LocationServiceImpl());
  RxString locationName = ''.obs;
  var selectedLo = Location().obs;

  void setDropdownValue(Location lo) {
    selectedLo.value = lo;
  }

  Future<String> getLocationName(String loCode) async {
    if (loCode.isNotEmpty) {
      SpUtil.putString("SYS_locationCode", loCode);

      Map locationsMap = await ls.getLocationList();

      if (locationsMap[loCode] == null) {
        SpUtil.putString("SYS_locationCode", '');
        return Future.value('');

      }
      SpUtil.putString("SYS_locationName", locationsMap[loCode]);
      return locationsMap[loCode];
    }
    return '庫位不可空白';
  }

  @override
  void onInit() async {
    await SpUtil.getInstance();
    if (SpUtil.getString("SYS_locationCode").isNotEmpty){
      locationCodeTextController.text = SpUtil.getString("SYS_locationCode");
      locationName.value = SpUtil.getString("SYS_locationName");
    }
  }
// @override
// void onInit() async {
//   super.onInit();
//
//   Map locationsMap = await ls.getLocationList();
//   List temp = [];
//   locationsMap.forEach((k, v) {
//     temp.add(Location(
//       id:k,
//       name:v,
//     ));
//     locationList.assignAll(temp);
//     // locationList.add(DropdownMenuItem(
//     //   child: new Text(v),
//     //   value: k,
//     // ));
//     print('$k: $v');
//   });
//
//   //selectLoc.value = locationList[0];
//   //this.getAllPosts();
//   print('LocationSettingController=====>>>onInit');
// }
}
