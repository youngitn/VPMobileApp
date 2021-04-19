import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cross_one_controller.dart';
import 'cross_two_controller.dart';
import 'cross_two_second_controller.dart';

class CrossTwoPage extends StatelessWidget {
  //final CrossTwoSecondController controller = Get.put(CrossTwoSecondController());
  @override
  Widget build(BuildContext context) {
    //Get.put(CrossTwoController());
    return Scaffold(
      appBar: AppBar(title: Text('CrossTwoPage')),
      body: Container(
          child: Column(
        children: [
          CheetahButton(text:'打印CrossTwoController', onPressed:() {
            print(Get.find<CrossTwoController>());
          }),
          CheetahButton(text:'CrossTwoSecondController', onPressed:() {
            print(Get.find<CrossTwoSecondController>());
          }),
          CheetahButton(text:'打印CrossOneController的age', onPressed:() {
            print(Get.find<CrossOneController>().age);
          }),
        ],
      )),
    );
  }
}
