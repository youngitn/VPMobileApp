import 'dart:convert';

import 'package:demo_getx/modules/dynamic_list/dynamic_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_table/json_table.dart';

class DynamicListPage extends GetView<DynamicListDataController> {
  // DynamicListDataController c = Get.put(DynamicListDataController(
  //     networkManager: NetworkManager(
  //         isEnableLogger: true,
  //         options:
  //             BaseOptions(baseUrl: "http://192.168.0.184:8081/kanbanApi"))));

  bool toggle = true;
  List<JsonTableColumn> columns = [
    JsonTableColumn("pmaal004", label: "Name"),
    JsonTableColumn("imaal003", label: "Age"),
    //JsonTableColumn("DOB", label: "Date of Birth", valueBuilder: formatDOB),
    // JsonTableColumn("age",
    // label: "Eligible to Vote", valueBuilder: eligibleToVote),
    JsonTableColumn("xmdh017", label: "E-mail", defaultValue: "NA"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TEST Page-get T100 data')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0.0),
        child: Container(
          child: toggle
              ? Column(
                  children: [
                    Obx(() {
                      if (controller.items.length == 0) {
                        return Text('資料讀取中.......');
                      }

                      return JsonTable(
                        //c.items.toJson(),
                        controller.items.length == 0
                            ? []
                            : controller.items.toJson(),
                        showColumnToggle: true,
                        tableCellBuilder: (value) {
                          return Container(
                            height: 48.0,
                            child: Text('${value}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey[900],
                                    fontFamily: "新細明體")),
                          );
                        },
                        columns: columns,
                        allowRowHighlight: true,
                        rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
                        paginationRowCount: 20,
                        onRowSelect: (index, map) {
                          Get.dialog(Dialogx(map));
                          print(index);
                          print(map);
                        },
                      );
                    }),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Simple table which creates table direclty from json")
                  ],
                )
              : Center(
                  child: Text(getPrettyJSONString(controller.items.toJson())),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.grid_on),
          onPressed: () {
            controller.getAllPosts();
            //setState(
            //   () {
            toggle = !toggle;
            // },
            //);
          }),
    );
  }

  String getPrettyJSONString(jsonObject) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String jsonString = encoder.convert(json.decode(jsonObject));
    return jsonString;
  }
}

class Dialogx extends StatelessWidget {
  dynamic row;

  Dialogx(this.row);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("${row['xmdg028']}-${row['imaal003']}"),
      ),
      body: Text(row.toString()),
    );
  }
}
