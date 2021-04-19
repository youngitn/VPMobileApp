import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dispatch_list_controller.dart';
///使用GetView<目標類別> 在 this.controller 中自動注入"目標類別"
///
class DispatchListPage extends GetView<DispatchListController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DispatchListPage')),
      body: Container(
          child: Obx(() => Column(
                children: controller.imageFiles.map((e) => Text(e)).toList(),
              ))


      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
