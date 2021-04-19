import 'package:demo_getx/controller/home/get_data_controller.dart';
import 'package:demo_getx/data/provider/api.dart';
import 'package:demo_getx/modules/dynamic_list/dynamic_list_controller.dart';
import 'package:demo_getx/modules/issue/issue_controller.dart';
import 'package:demo_getx/modules/location_setting/location_setting_controller.dart';
import 'package:demo_getx/modules/qr_scaner/qr_scanner_controller.dart';
import 'package:demo_getx/modules/stock/stock_controller.dart';
import 'package:demo_getx/modules/work_order/work_order_controller.dart';
import 'package:get/get.dart';
import 'package:vexana/vexana.dart';

class GetDataBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<GetDataController>(() =>

        ///HomeController注入MyRepository
        GetDataController(
            networkManager: NetworkManager(
                isEnableLogger: true, options: BaseOptions(baseUrl: baseUrl)),
            devNetworkManager: NetworkManager(
                isEnableLogger: true,
                options: BaseOptions(baseUrl: devBaseUrl))));

    Get.lazyPut<DynamicListDataController>(() => DynamicListDataController(
        networkManager: NetworkManager(
            isEnableLogger: true, options: BaseOptions(baseUrl: baseUrl))));

    Get.lazyPut<StockController>(() => StockController(
        // networkManager: NetworkManager(
        //   isEnableLogger: true,
        //   options: BaseOptions(baseUrl: baseUrl),
        // ),
        ));

    Get.lazyPut<WorkOrderController>(
      () => WorkOrderController(
          // networkManager: NetworkManager(
          //   isEnableLogger: true,
          //   options: BaseOptions(baseUrl: devBaseUrl),
          // ),
          ),
    );

    Get.lazyPut<IssueController>(
          () => IssueController(
        // networkManager: NetworkManager(
        //   isEnableLogger: true,
        //   options: BaseOptions(baseUrl: devBaseUrl),
        // ),
      ),
    );

    Get.lazyPut<QrScannerController>(
          () => QrScannerController(
        // networkManager: NetworkManager(
        //   isEnableLogger: true,
        //   options: BaseOptions(baseUrl: devBaseUrl),
        // ),
      ),
    );

    Get.put<LocationSettingController>(
        LocationSettingController()
    );
  }
}
