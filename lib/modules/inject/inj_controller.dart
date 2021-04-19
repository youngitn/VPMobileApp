import 'package:demo_getx/modules/inject/api.dart';
import 'package:get/get.dart';

class InjController extends GetxController {
  Api api = Get.find<Api>();
  final _obj = 0.obs;
  set obj(int value) => this._obj.value = value;
  int get obj => this._obj.value;

  //Get.putAsync使用搭配getInstance()
  // static InjectSimpleController instance;
  // static Future<InjectSimpleController> getInstance() async {
  //   if (instance == null) {
  //     Future.delayed(Duration(milliseconds: 500));
  //     instance = InjectSimpleController();
  //   }
  //   return instance;
  // }


  getAge() async {
    var i = await api.getAge();
    obj = i;
    print('getAge==$i');
  }
}