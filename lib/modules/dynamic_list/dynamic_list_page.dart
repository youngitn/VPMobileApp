import 'dart:io';

import 'package:demo_getx/modules/dynamic_list/simple_table.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dynamic_list_controller.dart';

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}



class DynamicListPagex extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Table Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Table Widget"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Simple Table",
              ),
              // Tab(
              //   text: "Custom Table",
              // ),
              // Tab(
              //   text: "Nested Data Table",
              // ),
              // Tab(
              //   text: "Local Data Table",
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //SimpleTable(),
            // CustomColumnTable(),
            // CustomColumnNestedTable(),
            // LocalTable(),
          ],
        ),
      ),
    );
  }
}
