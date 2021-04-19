import 'dart:convert';

import 'package:demo_getx/data/model/stock.dart';
import 'package:demo_getx/data/provider/api.dart';
import 'package:dio/dio.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:let_log/let_log.dart';
import 'package:vexana/vexana.dart';

import 'location_service.dart';

class LocationServiceImpl extends GetxService implements LocationService {

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: baseUrl),
  );

  @override
  Future<Map> getLocationList() async {

    // Logger.net(baseUrl+"getInaylMap", data: {"search": ''}, type: "http.get");
    //
    // final response = await networkManager.send<String,List<String>>(
    //     "getInaylMap",
    //     parseModel: Map<String,String>(),
    //     method: RequestType.GET);
    // Logger.endNet(
    //   "ws/chat/getList",
    //   data: response.data.toString(),
    // );
    //
    // if (response.data is List) {
    //   return response.data;
    //   //jsonRes.value = jsonEncode(response.data);
    //}
    Response response;
    try {
       response = await Dio().get(baseUrl+'getInaylMap');
      print(response);
    } catch (e) {
      print(e);
    }
    Map valueMap = json.decode(response.toString());
    return valueMap;
  }
}
