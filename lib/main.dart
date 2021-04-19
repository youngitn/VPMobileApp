import 'package:demo_getx/routes/app_pages.dart';
import 'package:demo_getx/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:let_log/let_log.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'modules/home/vp_home_page.dart';
import 'modules/inject/global/async_controller.dart';
import 'modules/inject/global/put_controller.dart';
import 'modules/local/app_translation.dart';

//TODO:UI和邏輯需要確實分離 例如:UI上的onPress的邏輯寫在controller裡面
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Logger.config.maxLimit = 10;
  Logger.config.printNet = true;
  ///有用到async加入 ref:https://medium.com/@newpage0720/flutter-%E5%AF%ABvoid-main-%E6%9C%89%E7%94%A8%E5%88%B0async%E6%99%82%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A0%85-e0b8447e0380
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<PutController>(PutController());
  //Get.lazyPut<LazyController>(() => LazyController());
  //Get.put<LazyController>(LazyController());
  //Get.put<Api>(Api());
  //Get.put<InjectSimpleController>(InjectSimpleController());
  Get.putAsync<AsyncController>(() async {
    final controller = await AsyncController.getInstance();
    return controller;
  });
  Get.putAsync<SharedPreferences>(() async {
    final sp = await SharedPreferences.getInstance();
    return sp;
  });

  void localLogWriter(String text, {bool isError = false}) {
    if(isError){
      Logger.error(text);
    }else{
      Logger.log(text);
    }

  }

  Logger.log("這是log這是log這是log這是log這是log這是log這是log這是log這是log這是log這是log這是log這是log");
  runApp(

      GetMaterialApp(

    //initialBinding: InjectSimpleBinding(),
    debugShowCheckedModeBanner: true,
    enableLog: true,
    logWriterCallback: localLogWriter,
    initialRoute: '/',
    theme: appThemeData,
    ///語系
    locale: Locale('fr', 'Ca'),
    fallbackLocale: Locale('en', 'US'), /// 添加一个回调语言选项，以备上面指定的语言翻译不存在
    defaultTransition: Transition.fade,///傳換動畫
    translationsKeys: AppTranslation.translations,
    getPages: AppPages.pages,
    home: VpHomePage(),
    ///全域 when unfocus then 隱藏鍵盤
    builder: (context, child) => Scaffold(
      // Global GestureDetector that will dismiss the keyboard
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }

        },
        child: child,
      ),
    ),
  ));

}
//用Flutter创建一个简单的SnackBar，你必须获得Scaffold的context，或者你必须使用一个GlobalKey附加到你的Scaffold上。
