import 'package:demo_getx/modules/inject/global_one_page.dart';
import 'package:demo_getx/modules/inject/inject_simple_page.dart';
import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/async_controller.dart';
import 'global/lazy_controller.dart';
import 'global/put_controller.dart';
import 'global_two_page.dart';
import 'inject_simple_binding.dart';

class InjectHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GlobalOnePage')),
      body: Column(
        children: [
          CheetahButton(text:'依赖注入demo', onPressed:() {
            Get.to(InjectSimplePage(),
            binding: InjectSimpleBinding()
            );
          }, ),

          CheetahButton(text:'全局注入页面1', onPressed:() {
            Get.to(GlobalOnePage());
          }),
          CheetahButton(text:'全局注入页面2', onPressed:() {
            Get.to(GlobalTwoPage());
          }),
        ],
      ),
    );
  }
}
