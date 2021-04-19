import 'dart:convert';

import 'package:demo_getx/data/model/model.dart';
import 'package:demo_getx/data/model/stock.dart';
import 'package:demo_getx/data/model/work_order_info.dart';
import 'package:demo_getx/service/work_order_service.dart';
import 'package:demo_getx/service/work_order_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vexana/vexana.dart';

class WorkOrderController extends GetxController {
  //INetworkManager networkManager;
  TextEditingController textController = TextEditingController();
  WorkOrderController();


  var items = [].obs;
  var jsonRes = ''.obs;
  var workOrder = ''.obs;
  //get postList => this.data.value;

  WorkOrderService workOrderService = WorkOrderServiceImpl();

  Future<bool> getWorkOrderListByWorkOrderNum() async {
    if (textController.text.isEmpty){
      return false;
    }
    // final response = await networkManager.fetch<WorkOrderInfo, List<WorkOrderInfo>>(
    //     "/getWorkOrderListWithDetail?sfaaent=100&sfaadocno=${textController.text}",
    //
    //     parseModel: WorkOrderInfo(),
    //     method: RequestType.GET);
    workOrder.value = textController.text;
    print("==========================>OK");
    List list = await workOrderService.getWorkOrderListByWorkOrderNum(textController.text);

    if (list is List) {
      items.assignAll(list);
      jsonRes.value = jsonEncode(list);
    }

    //items.value = data.value.data;
  }

  @override
  void onInit() async {
    super.onInit();
    //this.getAllPosts();
    print('WorkOrderController=====>>>onInit');
  }

}
