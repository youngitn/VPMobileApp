import 'package:demo_getx/data/model/work_order_info.dart';
import 'package:demo_getx/data/provider/api.dart';
import 'package:demo_getx/service/work_order_service.dart';
import 'package:let_log/let_log.dart';
import 'package:vexana/vexana.dart';

class WorkOrderServiceImpl implements WorkOrderService {
  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: devBaseUrl),
  );

  @override
  Future<List> getWorkOrderListByWorkOrderNum(String workOrderNum) async {
    final response =
        await networkManager.fetch<WorkOrderInfo, List<WorkOrderInfo>>(
            "/getWorkOrderListWithDetail?sfaaent=100&sfaadocno=$workOrderNum",
            parseModel: WorkOrderInfo(),
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
}
