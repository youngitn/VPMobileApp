import 'package:demo_getx/modules/qr_scaner/qr_scanner_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInputField extends GetWidget<QrScannerController> {
  ///輸入提示
  final String hintText;

  ///欄位標籤
  final String labelText;

  ///按下ENTER要執行的邏輯
  final ValueChanged<String> onSubmitted;

  ///該欄位的TextEditingController
  final TextEditingController textEditingController;

  ///放大鏡ICON按下後要執行的邏輯
  final VoidCallback onPressed;

  final VoidCallback theFunctionOfAfterSanQRCode;



  ///查詢用文字輸入欄位
  TextInputField({
    @required this.onSubmitted,
    @required this.textEditingController,
    @required this.onPressed,
    @required this.hintText,
    @required this.labelText,
    @required this.theFunctionOfAfterSanQRCode,

  });

  @override
  Widget build(BuildContext context) {
    QrScannerController qrScannerController = Get.find();
    return TextField(
      //readOnly:true,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.go,
      controller: textEditingController,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(23.0),
          borderSide: new BorderSide(),
        ),

        hintText: hintText,
        labelText: labelText,
        suffix: Container(
          width: 100,
          child: ButtonBar(buttonPadding: EdgeInsets.zero, children: [
            // IconButton(
            //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //   icon: Icon(Icons.search),
            //   iconSize: 20,
            //   onPressed: onPressed,
            // ),
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              icon: Icon(Icons.qr_code),
              iconSize: 50,
              onPressed: () async {
                await qrScannerController.scanQR();
                textEditingController.text = qrScannerController.result.value;
                theFunctionOfAfterSanQRCode();
              },
            ),
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              icon: Icon(Icons.clear),
              iconSize: 50,
              onPressed: () {
                textEditingController.clear();
              },
            ),
          ]),
        ),

        // suffixIcon: IconButton(
        //   onPressed: onPressed,
        //   icon: Icon(
        //     Icons.search_outlined,
        //   ),
        // ),
      ),
    );
  }
}
