import 'dart:ui';

import 'package:demo_getx/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_log/let_log.dart';

class VpHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SimpleController sc = Get.put(SimpleController());
    //Get.put(DispatchListController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/img/logo.jpg', width: Get.width),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            //height: Get.height * .45,
            decoration: BoxDecoration(
                //color: Colors.black,
                ),
            child: Column(
              children: [
                //SizedBox(height: 60),

                //SizedBox(height:10),
                Align(
                  alignment: Alignment.center,
                  child: Text("VP 行動作業平台",
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          height: 2,
                          fontSize: 25)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * .2, left: 20, right: 20),
            child: GridView.count(
              crossAxisCount: 2,
              //physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1,
              crossAxisSpacing: 50,
              mainAxisSpacing: 50,
              children: <Widget>[
                Card(
                  title: 'Module1',
                  icon: Icons.workspaces_filled,
                  onTap: () {
                    Get.toNamed(Routes.GET_DATA);
                    //Get.to(DispatchListPage());
                    //Get.snackbar("哈哈哈哈哈哈", "哈哈哈哈哈哈哈哈");
                  },
                ),
                Card(
                  title: 'Module2',
                  icon: Icons.apartment_outlined,
                  onTap: () {
                    print("點擊庫存查詢'");
                    Get.toNamed(Routes.STOCK);
                  },
                ),
                Card(
                  title: 'Logger',
                  icon: Icons.scanner,
                  onTap: () {
                    print("点击了路由'");
                    Get.to(()=>Logger());
                    //Get.to(DispatchListPage());
                    //Get.snackbar("哈哈哈哈哈哈", "哈哈哈哈哈哈哈哈");
                  },
                ),
                // Card(
                //   title: '列表',
                //   icon: Icons.scanner,
                //   onTap: () {
                //     print("点击了路由'");
                //     Get.toNamed(Routes.DYNAMIC_PAGE);
                //   },
                // ),
                // Card(
                //   title: '掃描工單條碼',
                //   icon: Icons.scanner,
                //   onTap: () {
                //     print("点击了路由'");
                //     Get.toNamed(Routes.DISPATCH_LIST);
                //     //Get.to(DispatchListPage());
                //     //Get.snackbar("哈哈哈哈哈哈", "哈哈哈哈哈哈哈哈");
                //   },
                // ),
                // Card(
                //   title: '路由',
                //   icon: Icons.router,
                //   onTap: () {
                //     print("点击了路由'");
                //     Get.toNamed(Routes.NAV);
                //     //Get.snackbar("哈哈哈哈哈哈", "哈哈哈哈哈哈哈哈");
                //   },
                // ),
                // Card(
                //   title: '路由',
                //   icon: Icons.router,
                //   onTap: () {
                //     print("点击了路由'");
                //     Get.toNamed(Routes.NAV);
                //     Get.snackbar("哈哈哈哈哈哈", "哈哈哈哈哈哈哈哈");
                //   },
                // ),
                // Card(
                //   title: 'State Manager',
                //   icon: Icons.stairs,
                //   onTap: () {
                //     Get.to(StatePage());
                //
                //     ///這邊的路由直接new頁面了
                //   },
                // ),
                // Card(
                //   title: '依赖注入',
                //   icon: Icons.inbox_outlined,
                //   onTap: () {
                //     Get.to(InjectHomePage()
                //         //,binding: InjectSimpleBinding()
                //         );
                //   },
                // ),
                // Card(
                //   title: '国际化',
                //   icon: Icons.language,
                //   onTap: () {
                //     Get.to(LocalPage());
                //   },
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback onTap;

  const Card({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: 10),
            Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),

            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
