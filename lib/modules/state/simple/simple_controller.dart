import 'package:get/get.dart';

class SimpleController extends GetxController {
  final _num = 0.obs;
  get num => this._num.value;
  set num(value) => this._num.value = value;
  var counter = 0.obs;
  var xxx = ''.obs;

  increment() {
    this.num++;
  }
  decrement() {
    this.num--;
  }
  // void increment() {
  //   counter++;
  //   update();
  // }

  void incrementx() {
    this.xxx.value = this.num.toString();
    //update();
  }

  @override
  void onInit() {
    super.onInit();
    print('SimpleController--onInit');
  }

  @override
  void onReady() {
    super.onReady();
    print('SimpleController--onReady');
  }

  @override
  void onClose() {
    super.onClose();
    print('SimpleController--onClose');
  }
}
