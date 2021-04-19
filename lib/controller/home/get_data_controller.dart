import 'package:demo_getx/data/model/model.dart';
import 'package:demo_getx/modules/issue/issue_controller.dart';
import 'package:demo_getx/modules/stock/stock_controller.dart';
import 'package:demo_getx/modules/work_order/work_order_controller.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:sp_util/sp_util.dart';
import 'package:vexana/vexana.dart';

class GetDataController extends GetxController {
  INetworkManager networkManager;
  INetworkManager devNetworkManager;

  GetDataController({
    @required this.networkManager,
    @required this.devNetworkManager,
  }) : assert(networkManager != null);

  final data = MyModel().obs;
  final items = [].obs;

  get postList => this.data.value;

  get stockController => Get.put(StockController());

  get workOrderController => Get.put(WorkOrderController());

  get issueController => Get.put(IssueController());

  Future<void> getAllPosts() async {
    final response = await networkManager.fetch<MyModel, MyModel>(
        "/getTobePickedShippingInfoListByXmdgdocno?xmdgdocno=VP2630-2010000312&page=1&per_page=1",
        parseModel: MyModel(),
        method: RequestType.GET);
    print("==========================>OK");
    print(response.data.data);
    //data.value = '{"data":[{"xmdg028":"2020-12-03","xmdg005":"H0003","sfaa050":"100","xmdh007":" ","xmdhdocno":"VP2630-2010000312","xmdh016":"100","xmdh017":"100","sfec014":"VP2230-2008003893","xmdgdocdt":"2020-10-16","xmdh015":"SET","sfec013":null,"xmda033":"G203253","pmaal004":"捷安特","xmdhseq":"1","sfec001":"VP5100-2008006424","xmdhent":"100","l_box":"2","xmdh001":"VP2230-2008003893","xmdhsite":"TWVP","xmdg002":"陳智茜","sfec012":"1241","xmdh006":"4012005111","imaal004":"K-MARK / 無商標蓋","imaal003":"腳踏 VP-113 9/16 BO BS/AS(入) 黑/灰膠","xmdh030":"0"},{"xmdg028":"2020-12-03","xmdg005":"H0003","sfaa050":null,"xmdh007":" ","xmdhdocno":"VP2630-2010000312","xmdh016":"30","xmdh017":"30","sfec014":null,"xmdgdocdt":"2020-10-16","xmdh015":"SET","sfec013":null,"xmda033":"G203253","pmaal004":"捷安特","xmdhseq":"2","sfec001":null,"xmdhent":"100","l_box":"1","xmdh001":"VP2230-2008003893","xmdhsite":"TWVP","xmdg002":"陳智茜","sfec012":null,"xmdh006":"401302511A","imaal004":"附VP-ARC6(4.5度) 本體止滑片刻GIANT & 調整孔","imaal003":"腳踏 VP-R73 9/16 CM 無反 液烤黑","xmdh030":"0"},{"xmdg028":"2020-12-03","xmdg005":"H0003","sfaa050":null,"xmdh007":" ","xmdhdocno":"VP2630-2010000312","xmdh016":"100","xmdh017":"100","sfec014":null,"xmdgdocdt":"2020-10-16","xmdh015":"SET","sfec013":null,"xmda033":"G203253","pmaal004":"捷安特","xmdhseq":"3","sfec001":null,"xmdhent":"100","l_box":"1","xmdh001":"VP2230-2008003893","xmdhsite":"TWVP","xmdg002":"陳智茜","sfec012":null,"xmdh006":"401Z011001","imaal004":null,"imaal003":"VP-C56 扣片零件包 白鎳","xmdh030":"0"},{"xmdg028":"2020-12-03","xmdg005":"H0003","sfaa050":"100","xmdh007":"W/O","xmdhdocno":"VP2630-2010000312","xmdh016":"100","xmdh017":"100","sfec014":"VP2230-2008003893","xmdgdocdt":"2020-10-16","xmdh015":"SET","sfec013":null,"xmda033":"G203253","pmaal004":"捷安特","xmdhseq":"4","sfec001":"VP5100-2008006476","xmdhent":"100","l_box":"2","xmdh001":"VP2230-2008003893","xmdhsite":"TWVP","xmdg002":"陳智茜","sfec012":"1241","xmdh006":"4013008111","imaal004":"K-MARK","imaal003":"腳踏 VP-469 9/16 BO BS/AS(入) 振動銀","xmdh030":"0"}],"page":1,"per_page":1}';
    data.value = response.data;
    items.assignAll(data.value.data);
  }

  void cleanSharedPreferencesOfLocation(){
    SpUtil.clear();
  }

  @override
  void onInit() async {
    super.onInit();
    await SpUtil.getInstance();
    //this.getAllPosts();
    print('GetDataControllerr=====>>>onInit');
  }
}
