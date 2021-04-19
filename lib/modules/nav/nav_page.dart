import 'package:demo_getx/modules/nav/simple_page.dart';
import 'package:demo_getx/routes/app_pages.dart';
import 'package:demo_getx/widget/CheetahButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CheetahButton(
                text: '直接路由', onPressed: () => Get.to(NavSimplePage())),

            ///NavSimplePage
            CheetahButton(
                text: '简单命名路由',
                onPressed: () async {
                  var result = await Get.toNamed(Routes.NAV_SIMPLE);
                  print('带参数命名路由返回：$result');
                }),

            ///NavSimplePage
            CheetahButton(
                text: 'arguments命名路由',
                onPressed: () async {
                  var result =
                      await Get.toNamed(Routes.NAV_SIMPLE, arguments: '石原里美');
                  print('带参数命名路由返回：$result');
                }),
            CheetahButton(
                text: 'arguments新路由',
                onPressed: () async {
                  var result =
                      await Get.toNamed(Routes.NAV_SIMPLE, arguments: '吳宗憲');
                  print('带参数命名路由返回：$result');
                }),
            CheetahButton(
              text: 'params命名路由',
              onPressed: () =>
                  Get.toNamed('${Routes.NAV_SIMPLE}?name=Julian&title=params'),
            ),
            CheetahButton(
              text: 'path命名路由',
              onPressed: () => Get.toNamed('${Routes.NAV_SIMPLE}/這是title'),
            ),
            CheetahButton(
                text: 'replace路由',
                onPressed: () {
                  Get.offNamed(Routes.NAV_SIMPLE);
                }),
            CheetahButton(
              text: 'Navigate and pop until...',
              onPressed: () => Get.offNamedUntil(
                Routes.NAV_SIMPLE,
                (route) => route.isFirst,
              ),
            ),
            CheetahButton(
              text: '删除当前路由',
              onPressed: () => Get.removeRoute(Get.routing.route),
            ),
            CheetahButton(
                text: 'flutter路由',
                onPressed: () {
                  navigator.pushNamed(Routes.NAV_SIMPLE);
                }),
            CheetahButton(
                text: '对话框',
                onPressed: () {
                  Get.defaultDialog(
                      onConfirm: () => print("Ok"),
                      middleText: "Dialog made in 3 lines of code");
                }),
            CheetahButton(
                text: 'snackbar',
                onPressed: () {
                  Get.snackbar('Hi', 'i am a modern snackbar');
                }),
            CheetahButton(
                text: 'BottomSheets',
                onPressed: () {
                  Get.bottomSheet(
                      Container(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                                leading: Icon(Icons.music_note),
                                title: Text('Music'),
                                onTap: () => {}),
                            ListTile(
                              leading: Icon(Icons.videocam),
                              title: Text('Video'),
                              onTap: () => {},
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.green);
                }),
          ],
        ),
      ),
    );
  }
}
