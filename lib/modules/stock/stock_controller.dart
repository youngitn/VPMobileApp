import 'dart:convert';


import 'package:demo_getx/data/model/stock.dart';
import 'package:demo_getx/modules/qr_scaner/qr_scanner_controller.dart';
import 'package:demo_getx/service/stock_service.dart';
import 'package:demo_getx/service/stock_service_impl.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';


class StockController extends GetxController {

  //INetworkManager networkManager;
  TextEditingController textController = TextEditingController();
  QrScannerController _sc = Get.find();
  get qrScannerController => _sc;
  // StockController({@required this.networkManager})
  //     : assert(networkManager != null);

  StockService ss = Get.put(StockServiceImpl());
  RxList items = [].obs;
  var jsonRes = ''.obs;

  //get postList => this.data.value;

  void setTest(){
    SpUtil.putString("key_username", textController.text);
  }
  Future<bool> getStockListByMaterial() async {
    if (textController.text.isEmpty) {
      return false;
    }
    // final response = await networkManager.fetch<Stock, List<Stock>>(
    //     "/getStock?search=where:inag001@${textController.text},and:inag008!=0,",
    //
    //     parseModel: Stock(),
    //     method: RequestType.GET);
    //
    // print("==========================>OK");
    //
    // print('------>'+jsonEncode(response.data));
    // if (response.data is List) {
    //   items.value = response.data;
    //   jsonRes.value = jsonEncode(response.data);
    // }
    List<dynamic> list =  (await ss.getStockListByMaterial(textController.text,/*networkManager*/)) ;

    items.assignAll(list);
    jsonRes.value = jsonEncode(list);

    //items.value = data.value.data;
  }

  @override
  void onInit() async {
    super.onInit();
    this.getStockListByMaterial();
    await SpUtil.getInstance();
    if (SpUtil.getString("key_username").isNotEmpty){
      textController.text = SpUtil.getString("key_username");
    }


    print('StockController=====>>>onInit');
  }
}
