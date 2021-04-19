import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:majascan/majascan.dart';

class QrScannerController extends GetxController {
  RxString result = ''.obs;

  Future scanQR() async {
    try {
      String qrResult = await MajaScan.startScan(
          title: "請將掃描區域對準QRcode ",
          titleColor: Colors.amberAccent[700],
          qRCornerColor: Colors.orange,
          qRScannerColor: Colors.orange);
      result.value = qrResult;
      // setState(() {
      //   result = qrResult;
      // });
    } on PlatformException catch (ex) {
      if (ex.code == MajaScan.CameraAccessDenied) {
        result.value = "Camera permission was denied";
        // setState(() {
        //   result = "Camera permission was denied";
        // });
      } else {
        result.value = "Unknown Error $ex";
        // setState(() {
        //   result = "Unknown Error $ex";
        // });
      }
    } on FormatException {
      result.value = "You pressed the back button before scanning anything";
      //     setState(() {
      //   result = "You pressed the back button before scanning anything";
      // });
    } catch (ex) {
      result.value = "Unknown Error $ex";
      // setState(() {
      //   result = "Unknown Error $ex";
      // });
    }
  }
}
