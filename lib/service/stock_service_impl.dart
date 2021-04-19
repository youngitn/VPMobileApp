import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:demo_getx/data/model/stock.dart';
import 'package:demo_getx/data/model/stock_by_location.dart';
import 'package:demo_getx/data/provider/api.dart';
import 'package:demo_getx/service/stock_service.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:let_log/let_log.dart';
import 'package:vexana/vexana.dart';

class StockServiceImpl extends GetxService implements StockService {
  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: baseUrl),
  );

  INetworkManager networkManagerDev = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: devBaseUrl),
  );

  @override
  Future<List> getStockListByMaterial(String material
      /*NetworkManager networkManager*/) async {
    Logger.net(baseUrl + "getStock",
        data: {"search": 'where:inag001@$material,and:inag008!=0,'},
        type: "http.get");
    final response = await networkManager.fetch<Stock, List<Stock>>(
        "getStock?search=where:inag001@$material,and:inag008!=0,",
        parseModel: Stock(),
        method: RequestType.GET);
    Logger.endNet(
      "ws/chat/getList",
      data: response.data.toString(),
    );

    if (response.data is List) {
      return response.data;
      //jsonRes.value = jsonEncode(response.data);
    }
    return [];
    //items.value = data.value.data;
  }

  @override
  String here() {
    return 'stock service here';
  }

  @override
  void onInit() {
    super.onInit();
    print('INIT STOCKSERVICE');
  }

  @override
  Future<List> getStockListByLocation(
      int ent, List workOrderNum, String location) async {

    final response =
        await networkManagerDev.fetch<StockByLocation, List<StockByLocation>>(
            "/getWorkOrderListWithDetailByLocation",
            queryParameters: {
              'sfaaent': ent,
              'sfaadocnos': JsonUtil.encodeObj(workOrderNum),
              'inaa004': location,
            },
            parseModel: StockByLocation(),
            method: RequestType.POST);
    Logger.endNet(
      "/getWorkOrderListWithDetailByLocation",
      data: response.data.toString(),
    );
    if (response.data is List) {
      return response.data;
      //jsonRes.value = jsonEncode(response.data);
    }
    return [];
  }
}
