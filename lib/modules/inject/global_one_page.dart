import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/async_controller.dart';
import 'global/lazy_controller.dart';
import 'global/put_controller.dart';

class GlobalOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GlobalOnePage')),
      body: Column(
        children: [
          //Text(Get.find<InjectSimpleController>();),
          CheetahButton(
              text: '打印PutController',
              onPressed: () {
                print('打印PutController==${Get.find<PutController>()}');
              }),
          CheetahButton(
              text: '打印LazyController',
              onPressed: () {
                print('打印LazyController==${Get.find<LazyController>()}');
              }),
          CheetahButton(
              text: '打印AsyncController',
              onPressed: () {
                print('打印AsyncController==${Get.find<AsyncController>()}');
              }),
          CheetahButton(
              text: '打印SharedPreferences',
              onPressed: () {
                print('打印SharedPreferences==${Get.find<SharedPreferences>()}');
              }),
        ],
      ),
    );
  }
}
