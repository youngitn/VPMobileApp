import 'package:demo_getx/data/model/stock_by_location.dart';
import 'package:demo_getx/modules/muti_work_order_issue/muti_work_order_issue_controller.dart';
import 'package:demo_getx/service/stock_service.dart';
import 'package:demo_getx/service/stock_service_impl.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class StockByLocationController extends GetxController {

  var stockByLocationList = [].obs;
  MutiWorkOrderIssueController mutiWorkOrderIssueController = Get.find();

  StockService stockService = StockServiceImpl();
  Future<bool> getWorkOrderListByWorkOrderNum(int ent,List workOrderNumList,String location) async {
    print("==========================>OK");
    List list = await stockService.getStockListByLocation(ent,workOrderNumList,location);

    if (list is List) {
      stockByLocationList.assignAll(list);

    }

    //items.value = data.value.data;
  }

  @override
  void onInit() async {
    print('INIT StockByLocationController');
    await SpUtil.getInstance();
    // if (SpUtil.getString("SYS_locationCode").isNotEmpty){
    //   locationCodeTextController.text = SpUtil.getString("SYS_locationCode");
    //   locationName.value = SpUtil.getString("SYS_locationName");
    // }
    await getWorkOrderListByWorkOrderNum(100,mutiWorkOrderIssueController.workOrderList(),SpUtil.getString("SYS_locationCode"));
  }

}