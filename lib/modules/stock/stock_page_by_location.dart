import 'dart:convert';

import 'package:demo_getx/widget/text_inpute_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_table/json_table.dart';


import 'stock_controller.dart';

///顯示庫存資訊
///過濾BY庫位查詢後的庫存資訊
class StockPageByLocation extends GetView<StockController> {

  bool toggle = true;

  List<JsonTableColumn> columns = [
    JsonTableColumn("inag001", label: "料號"),
    JsonTableColumn("inag100", label: "庫位"),
    JsonTableColumn("inag004", label: "庫位編號"),
    //JsonTableColumn("DOB", label: "Date of Birth", valueBuilder: formatDOB),
    // JsonTableColumn("age",
    // label: "Eligible to Vote", valueBuilder: eligibleToVote),
    //JsonTableColumn("xmdh017", label: "E-mail", defaultValue: "NA"),
  ];

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(title: Text('庫存查詢X')),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
        ),
        child: toggle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    onSubmitted: (value) {
                      if (controller.textController.text.isEmpty) {
                        controller.items.assignAll([]);
                        Get.snackbar('系統訊息', '料號不可為空');
                      }
                      controller.getStockListByMaterialAndLocation();
                    },
                    theFunctionOfAfterSanQRCode: () {

                      controller.getStockListByMaterialAndLocation();
                    },
                    textEditingController: controller.textController,
                    hintText: ' 請輸入料號',
                    labelText: '料號 *',
                    onPressed: () {
                      if (controller.textController.text.isEmpty) {
                        controller.items.assignAll([]);
                        Get.snackbar('系統訊息', '料號不可為空');
                      }
                      controller.getStockListByMaterialAndLocation();
                    },
                  ),
                  Expanded(
                    //height: Get.height-200,
                    child: SingleChildScrollView(

                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        child: Obx(() {
                          if (controller.items.length == null ||
                              controller.items.length == 0) {
                            return Text('尚無資料');
                          }

                          return JsonTable(
                            //c.items.toJson(),
                            controller.items.length == 0
                                ? []
                                : jsonDecode(controller.jsonRes()),
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
                            rowHighlightColor:
                                Colors.yellow[500].withOpacity(0.7),
                            paginationRowCount: 20,
                            onRowSelect: (index, map) {
                              Get.dialog(Dialogx(map));
                              print(index);
                              print(map);
                            },
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(getPrettyJSONString(controller.items.toJson())),
              ),
      ),

      floatingActionButton: FloatingActionButton(
          heroTag: "btnStock",
          child: Icon(Icons.grid_on),
          onPressed: () {
            controller.setTest();
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
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("${row['inag001']}-${row['inag100']}"),
      ),
      body: Text(row.toString()),
    );
  }
}
