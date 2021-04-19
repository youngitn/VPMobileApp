import 'package:demo_getx/data/model/location.dart';
import 'package:demo_getx/modules/get_data/get_data_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'location_setting_controller.dart';

class LocationSettingPage extends GetView<LocationSettingController> {
  //LocationSettingController controller = Get.find();
  Location thislo;

  @override
  void onInit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("選擇發料倉"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              // child: Center(
              //   child: Container(
              //       width: 200,
              //       height: 150,
              //       /*decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(50.0)),*/
              //       child: Image.asset('assets/img/logo.jpg')),
              // ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: TextStyle(fontSize: 30),
                keyboardType: TextInputType.number,
                controller: controller.locationCodeTextController,
                // onSubmitted: (String value){
                //   controller.getLocationName(value).then((value) {controller.locationName.value = value;});
                //
                // },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '庫位編號',
                    hintText: '請輸入庫位編號'),
              ),
            ),
            SizedBox(
              height: 30,
              child: Text('*請輸入一個庫位編號'),
            ),
            Obx(
              () => SizedBox(
                height: 30,
                child: Text(
                  controller.locationName(),
                  style: TextStyle(color: Colors.indigo, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  controller
                      .getLocationName(
                          controller.locationCodeTextController.text)
                      .then((value) {

                    if (value.isNotEmpty ) {
                      Get.off(GetDataPage());
                    }else{
                      value = '查無資料';
                    }
                    controller.locationName.value = value;
                    Get.rawSnackbar(message: '庫位已設置為 ${value}');
                  });
                },
                child: Text(
                  '確定',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
