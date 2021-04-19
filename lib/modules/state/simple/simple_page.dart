import 'package:demo_getx/modules/state/simple/simple_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class SimplePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('SimplePage--build');
//     return GetBuilder<SimpleController>(
//         init: SimpleController(),
//         builder: (controller) {
//           return Scaffold(
//             appBar: AppBar(title: Text('Simple')),
//             body: Center(
//               child: Text(controller.counter.toString()),
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 controller.increment();
//               },
//               child: Icon(Icons.add),
//             ),
//           );
//         });
//   }
// }

class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('SimplePage--build');
    SimpleController sc = Get.put(SimpleController());
    //SimpleController sc = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('Simple')),
      body: Center(
        // child: GetBuilder<SimpleController>(
        //     init: SimpleController(),
        //     builder: (controller) {
        //       return Text(controller.counter.toString());
        //     }),
        child: Obx(() =>Text("${sc.num}")),
      ),
      persistentFooterButtons: [ Obx(() =>Text("${sc.xxx}"))],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sc.increment();
          sc.incrementx();
          return null;
          // controller..increment();
        },
        child: Icon(Icons.add),

      ),
    );
  }
}
