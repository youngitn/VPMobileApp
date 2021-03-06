import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'simple_advanced_controller.dart';

class SimpleAdvancedPage extends StatelessWidget {
  final SimpleAdvancedController controller = Get.put<SimpleAdvancedController>(SimpleAdvancedController());
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SimpleAdvancedController>(() => SimpleAdvancedController());
    return Scaffold(
      appBar: AppBar(title: Text('SimpleAdvancedPage')),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          GetBuilder<SimpleAdvancedController>(
            id: 'counter',
            builder: (ctl) => Text(ctl.counter.toString()),
          ),
          SizedBox(
            height: 50,
          ),
          GetBuilder<SimpleAdvancedController>(
            id: 'nameXX',
            builder: (ctl) => Text(ctl.firstName),
          ),
          GetBuilder<SimpleAdvancedController>(
            id: 'nameXXaa',
            builder: (ctl) => Text(ctl.firstName),
          ),
          CheetahButton(text:'换名', onPressed:() => controller.changeName()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
