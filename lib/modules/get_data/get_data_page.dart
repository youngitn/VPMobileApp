import 'package:demo_getx/controller/home/get_data_controller.dart';
import 'package:demo_getx/modules/muti_work_order_issue/muti_work_order_issue_page.dart';
import 'package:demo_getx/routes/app_pages.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class GetDataPage extends GetView<GetDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.redAccent,
          icon: Icon(Icons.refresh),
          label: Text('重設庫位'),
          heroTag: "btnsss",
          onPressed: () {
            controller.cleanSharedPreferencesOfLocation();
          }),

      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
          ),
          title: Obx(() => Text(
              'Module1 ${controller.stockController.items.length} ${controller.workOrderController.items.length}'))),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('庫位設置'),
              onTap: () {
                Get.toNamed(Routes.LOCATION_SETTING_PAGE);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(1),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 3,
        children: [
          Container(
            //transform: Matrix4.rotationZ(0.1),
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                Get.toNamed(Routes.WORK_ORDER);
              },
              // The custom button
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('工單查詢'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                Get.toNamed(Routes.STOCK);
              },
              // The custom button
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('庫存查詢'),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                if (SpUtil.getString("SYS_locationCode").isEmpty) {
                  Get.snackbar('系統訊息', '查無庫位資訊,請先設置庫位');
                } else {
                  Get.toNamed(
                    Routes.ISSUE,
                  );
                }
              },
              // The custom button
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.scatter_plot_outlined,
                        size: 40,
                      ),
                      onPressed: () {
                        if (SpUtil.getString("SYS_locationCode").isEmpty) {
                          Get.snackbar('系統訊息', '查無庫位資訊');
                        } else {
                          Get.toNamed(
                            Routes.ISSUE,
                          );
                        }
                      },
                    ),
                    Text('發料'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () {
                if (SpUtil.getString("SYS_locationCode").isEmpty) {
                  Get.snackbar('系統訊息', '查無庫位資訊,請先設置庫位');
                } else {
                  // Get.toNamed(
                  //   Routes.ISSUE,
                  // );
                  Get.to(MutiWorkOrderIssuePage());
                }
              },
              // The custom button
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_road,
                        size: 40,
                      ),
                      onPressed: () {
                        if (SpUtil.getString("SYS_locationCode").isEmpty) {
                          Get.snackbar('系統訊息', '查無庫位資訊');
                        } else {
                          // Get.toNamed(
                          //   Routes.ISSUE,
                          // );
                          Get.to(MutiWorkOrderIssuePage());
                        }
                      },
                    ),
                    Text('多工單發料'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //child: Obx(()=> Text("${controller.items.length==0?"等一下資料...":controller.items.value[1]}")),
      // child: IconButton(
      //   icon: Icon(Icons.access_time),
      //   onPressed: () {
      //     Get.to(StockPage());
      //   },
      // )),
    );
  }
}
