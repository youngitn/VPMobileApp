import 'package:demo_getx/modules/qr_scaner/qr_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class QrScannerPage extends GetView<QrScannerController> {
  //String result = "Hey there !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Obx(() => Text(
              controller.result.string,
              style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: () {
          controller.scanQR();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
