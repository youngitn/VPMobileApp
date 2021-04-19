import 'package:demo_getx/modules/stock/stock_controller.dart';
import 'package:demo_getx/modules/work_order/work_order_controller.dart';
import 'package:demo_getx/routes/app_pages.dart';
import 'package:demo_getx/service/location_service.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class IssueController extends GetxController {
  WorkOrderController _w = Get.find();

  StockController _s = Get.find();
  LocationService ls = Get.find();
  RxString locationName = ''.obs;

  get workOrderController => _w;

  get stockController => _s;

  get workOrderNum => _w.textController.text;

  get material => _s.textController.text;

  void getLocationName() async {
    //await SpUtil.getInstance();
    await SpUtil.getInstance();

    // print("------------->" + SpUtil.getString("SYS_locationCode"));
    // if (SpUtil.getString("SYS_locationCode").isEmpty) {
    //   Get.toNamed(Routes.LOCATION_SETTING_PAGE);
    //   Get.rawSnackbar(message: '查無庫位');
    // }

    locationName.value = SpUtil.getString("SYS_locationName");
  }

  @override
  void onInit() async {
    super.onInit();
    print('IssueController onReady');
    await getLocationName();
  }
}
