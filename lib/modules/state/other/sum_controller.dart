import 'package:get/state_manager.dart';

class SumController extends GetxController {
  var count1 = 0.obs;
  var count2 = 0.obs;

  int get sum => count1.value + count2.value;

  increment() => count1++;

  increment2() => count2++;

  @override
  onInit() {
    super.onInit();

    /// 每次更改都会回调
    ever(count1, (_) => print("$_ has been changed"));

    /// 第一次更改回调
    once(count1, (_) => print("$_ was changed once"));

    /// 更改后3秒回调
    debounce(count1, (_) => print("debouce$_"), time: Duration(seconds: 3));

    ///3秒内更新回调一次
    interval(count1, (_) => print("interval $_"), time: Duration(seconds: 3));
  }
}
