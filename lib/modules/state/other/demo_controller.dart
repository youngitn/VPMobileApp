import 'package:demo_getx/modules/state/models/emp.dart';
import 'package:english_words/english_words.dart';
import 'package:get/get.dart';

class DemoController extends GetxController{
  final emp = Emp().obs;

  updateEmp(int count) {
    emp.update((value) {
      value.empName = WordPair.random().asPascalCase;
      value.age = count;
    });
  }
}