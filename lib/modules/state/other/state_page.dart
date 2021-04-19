import 'package:demo_getx/modules/state/cross/cross_one_page.dart';
import 'package:demo_getx/modules/state/other/demo_page.dart';
import 'package:demo_getx/modules/state/other/reactive_page.dart';
import 'package:demo_getx/modules/state/simple/simple_controller.dart';
import 'package:demo_getx/modules/state/simple/simple_page.dart';
import 'package:demo_getx/modules/state/simpleadvanced/simple_advanced_page.dart';
import 'package:demo_getx/modules/state/test/test_pagr.dart';
import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_page.dart';

class StatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('状态管理')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CheetahButton(text:'简单', onPressed:() => Get.to(SimplePage())),
            CheetahButton(text:'局部更新',onPressed: () => Get.to(SimpleAdvancedPage())),
            CheetahButton(text:'响应式更新', onPressed:() => Get.to(ReactivePage())),
            CheetahButton(text:'大乱斗', onPressed:() => Get.to(AllPage())),
            CheetahButton(text:'DEMO', onPressed:() => Get.to(DemoPage())),
            CheetahButton(text:'跨组件', onPressed:() => Get.to(CrossOnePage())),
            CheetahButton(text:'List', onPressed:() => Get.to(TestPage())),
          ],
        ),
      ),
    );
  }
}
