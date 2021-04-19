import 'package:get/get.dart';

class DispatchListController extends GetxController {
  final RxList<String> imageFiles = <String>[].obs;

  int count = 0;



  add() {
    imageFiles.add("${count++}");

  }

  @override
  void onInit()
  {
    super.onInit();
    print('DispatchListController=====>>>onInit');
  }

  @override

  @override
  void onClose() {
    super.onClose();
    print('DispatchListController=====>>>onClose');
  }
}
