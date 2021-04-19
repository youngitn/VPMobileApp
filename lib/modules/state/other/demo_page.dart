import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'count_controller.dart';
import 'demo_controller.dart';

class DemoPage extends StatelessWidget {
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GetBuilder<CountController>(
              builder: (controller) => TextFormField(
                keyboardType:TextInputType.number,
                maxLength :10,
                initialValue: '${controller.count}',
                onChanged: (value) {
                  controller.set(num:int.parse(value==''?'0':value));
                  print('${controller.count}');
                  Dialog(child: Text('${controller.count}'));
                },
              ),
            ),
            GetBuilder<CountController>(
              builder: (controller) => Text(
                '更新count: ${controller.count}',
              ),
            ),
            SizedBox(
              height: 1,
            ),
            GetX<DemoController>(
              init: DemoController(),
              builder: (_) => Text('更新empName: ${_.emp.value.empName}'),
            ),
            SizedBox(
              height: 1,
            ),
            Obx(
              () => Text(
                  '更新emp的age值: ${Get.find<DemoController>().emp.value.age}'),
            ),
            RaisedButton(
              child: Text("Update UserController"),
              onPressed: () {
                Get.find<DemoController>()
                    .updateEmp(Get.find<CountController>().count);
              },
            ),
            SizedBox(
              height: 1,
            ),
            RaisedButton(
              child: Text("Update CountController"),
              onPressed: () {
                Get.find<CountController>().increment();
              },
            ),
          ],
        )),
      );

  }
}
