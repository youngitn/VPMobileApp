import 'package:demo_getx/data/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:vexana/vexana.dart';

class DynamicListDataController extends GetxController {
  INetworkManager networkManager;

  DynamicListDataController({@required this.networkManager})
      : assert(networkManager != null);

  final data = MyModel().obs;
  final  items = [].obs;
  //get postList => this.data.value;



  Future<void> getAllPosts() async {
    final response = await networkManager.fetch<MyModel, MyModel>(
        "/getTobePickedShippingInfoListByXmdgdocno?xmdgdocno=VP2630-2101000418&page=1&per_page=1",
        parseModel: MyModel(),
        method: RequestType.GET);

    print("==========================>OK");

    print(response.data.data);

    data.value = response.data;
    items.value = data.value.data;


  }

  @override
  void onInit() async {
    super.onInit();
    this.getAllPosts();
    print('DispatchListController=====>>>onInit');

  }


}