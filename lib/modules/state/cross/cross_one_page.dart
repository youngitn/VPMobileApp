import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cross_one_controller.dart';
import 'cross_three_controller.dart';
import 'cross_two_controller.dart';
import 'cross_two_page.dart';
import 'cross_two_second_controller.dart';

///這部分主要就是在實驗誇組件(頁面)之間要能夠取用到共同的狀態的話,
///controller不能夠為空,要避免為空要先確定取用的範圍,在適合的階段宣告.
///後續還有依賴注入的作法.
class CrossOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CrossOneController controller = Get.put(CrossOneController());
    CrossTwoController controller1 = Get.put(CrossTwoController());
    CrossTwoSecondController controller2 = Get.put(CrossTwoSecondController());
    return Scaffold(
      appBar: AppBar(title: Text('跨组件')),
      body: Container(
          child: Column(
        children: [
          CheetahButton(
              text: '更改controller的age',
              onPressed: () {
                controller.age++;
                print(controller.age);
              }),
          CheetahButton(
              text: '去第二个页面',
              onPressed: () {
                Get.to(CrossTwoPage());
              }),
          CheetahButton(
              text: '去第三个个页面',
              onPressed: () {
                Get.to(CrossTwoPage());
              }),
          CheetahButton(
              text: '打印CrossTwoController',
              onPressed: () {
                print(Get.find<CrossTwoController>());
              }),
          CheetahButton(
              text: 'CrossTwoSecondController',
              onPressed: () {
                print(Get.find<CrossTwoSecondController>());
              }),
          CheetahButton(
              text: '打印CrossThreeController',
              onPressed: () {
                print(Get.find<CrossThreeController>());
              }),
        ],
      )),
    );
  }
}
