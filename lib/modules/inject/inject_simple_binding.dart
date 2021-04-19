import 'package:demo_getx/modules/dispatch_list/dispatch_list_controller.dart';
import 'package:get/get.dart';

import 'api.dart';
import 'inj_controller.dart';
import 'inject_simple_controllere.dart';

class InjectSimpleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Api>(() => Api());
    Get.lazyPut<InjectSimpleController>(() => InjectSimpleController(),
        fenix: true);
    Get.lazyPut<InjController>(() => InjController(), fenix: true);

    //Get.put<InjectSimpleController>( InjectSimpleController(), permanent :true);
    // Get.putAsync(() async {
    //   return await InjectSimpleController.getInstance();
    // });
    Get.lazyPut<DispatchListController>(() => DispatchListController(), fenix: true);
  }
}
