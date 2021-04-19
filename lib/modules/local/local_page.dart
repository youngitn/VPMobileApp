import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_translation.dart';

class LocalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),
      body: Column(
        children: [
          CheetahButton(text: LocaleKeys.buttons_login.tr, onPressed: () {}),
          CheetahButton(text: LocaleKeys.buttons_logout.tr, onPressed: () {}),
          CheetahButton(text: LocaleKeys.buttons_sign_in.tr, onPressed: () {}),
          CheetahButton(
              text: LocaleKeys.buttons_change_zh.tr,
              onPressed: () {
                var locale = Locale('zh', 'CN');
                Get.updateLocale(locale);
              }),
          CheetahButton(
              text: LocaleKeys.buttons_change_en.tr,
              onPressed: () {
                var locale = Locale('en', 'US');
                Get.updateLocale(locale);
              }),
          CheetahButton(
              text: '改变主题',
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              }),
        ],
      ),
    );
  }
}
