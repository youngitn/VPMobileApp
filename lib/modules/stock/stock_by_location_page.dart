import 'package:demo_getx/modules/stock/stock_by_location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class StockByLocationPage extends GetView<StockByLocationController> {
  StockByLocationController controller = Get.put(StockByLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('待發料清單'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.stockByLocationList().length,
          //padding: const EdgeInsets.only(top: 10.0),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      '儲位: ${controller.stockByLocationList()[index].inag005.substring(4, 7)}'),
                  Text(
                      '料號: ${controller.stockByLocationList()[index].sfba005}'),
                  Text(
                      '單位: ${controller.stockByLocationList()[index].sfba014}'),
                  ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        //controller.stockByLocationList(index);
                        print(index);
                      },
                    ),
                    subtitle: Text(
                        '${controller.stockByLocationList()[index].imaal003}'),
                    title: Text(
                        '${controller.stockByLocationList()[index].sfaadocno}'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
