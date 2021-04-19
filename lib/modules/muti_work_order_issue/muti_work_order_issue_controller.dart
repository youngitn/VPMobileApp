import 'dart:convert';

import 'package:demo_getx/service/work_order_service.dart';
import 'package:demo_getx/service/work_order_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MutiWorkOrderIssueController extends GetxController {
  //MutiWorkOrderIssueController();
  final HttpLink httpLink = HttpLink(
    uri: 'http://192.168.0.62:8080/graphql',
  );

  //INetworkManager networkManager;
  TextEditingController textController = TextEditingController();

  var items = [].obs;
  var jsonRes = ''.obs;
  var workOrder = ''.obs;
  var workOrderList = [].obs;

  //get postList => this.data.value;

  WorkOrderService workOrderService = WorkOrderServiceImpl();

  bool addWordListItem(String orderNum) {
    if (textController.text.isEmpty) {
      return false;
    }
    workOrderList.add(orderNum);
    return true;
  }

  bool removeWordListItem(int index) {
    if (textController.text.isEmpty) {
      return false;
    }
    workOrderList.removeAt(index);
    print(workOrderList().length);
    return true;
  }

  Future<bool> getWorkOrderListByMaterial() async {
    if (textController.text.isEmpty) {
      return false;
    }
    // final response = await networkManager.fetch<WorkOrderInfo, List<WorkOrderInfo>>(
    //     "/getWorkOrderListWithDetail?sfaaent=100&sfaadocno=${textController.text}",
    //
    //     parseModel: WorkOrderInfo(),
    //     method: RequestType.GET);
    workOrder.value = textController.text;
    print("==========================>OK");
    List list = await workOrderService
        .getWorkOrderListByWorkOrderNum(textController.text);

    if (list is List) {
      items.assignAll(list);
      jsonRes.value = jsonEncode(list);
    }

    //items.value = data.value.data;
  }

  ValueNotifier<GraphQLClient> initailizeClient(String token) {
    // _token = token;
    print('initailizeClient');
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: httpLink,
      ),
    );
    print('initailizeClient end');

    // client.value.query( QueryOptions(
    //   documentNode: gql(TodoFetch.fetchAll),
    //   //variables: {"is_public": false},
    // )).then((value) => print('-------------->'+value.data));
    return client;
  }

  @override
  void onInit() async {
    super.onInit();
    //this.getAllPosts();
    print('WorkOrderController=====>>>onInit');
  }
}
