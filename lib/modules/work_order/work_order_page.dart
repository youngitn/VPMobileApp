import 'dart:convert';

import 'package:demo_getx/widget/text_inpute_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_table/json_table.dart';

import 'work_order_controller.dart';

@immutable
class WorkOrderPage extends GetView<WorkOrderController> {
  bool toggle = true;
  final scrollController = ScrollController();
  List<JsonTableColumn> columns = [
    JsonTableColumn("sfbaseq", label: "項次"),
    JsonTableColumn("sfba005", label: "料號"),
    JsonTableColumn("sfba013", label: "數量"),
    JsonTableColumn("sfba016", label: "已發數量"),
    JsonTableColumn("sfba014", label: "單位"),
    //JsonTableColumn("DOB", label: "Date of Birth", valueBuilder: formatDOB),
    // JsonTableColumn("age",
    // label: "Eligible to Vote", valueBuilder: eligibleToVote),
    //JsonTableColumn("xmdh017", label: "E-mail", defaultValue: "NA"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      appBar: AppBar(title: Text('工單查詢')),
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
                        Get.snackbar('系統訊息', '工單號不可為空');
                      }
                      controller.getWorkOrderListByWorkOrderNum();
                    },
                    textEditingController: controller.textController,
                    hintText: ' 請輸入工單號碼',
                    labelText: '工單號碼 *',
                    onPressed: () {
                      if (controller.textController.text.isEmpty) {
                        controller.items.assignAll([]);
                        Get.snackbar('系統訊息', '工單號不可為空');
                      }
                      controller.getWorkOrderListByWorkOrderNum();
                    },
                    theFunctionOfAfterSanQRCode: () {
                      controller.getWorkOrderListByWorkOrderNum();
                    },
                  ),


                  Expanded(
                    //height: Get.height-200,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        child: Obx(() {
                          if (controller.items.length == 0) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('暫無資料')],
                            );
                          }

                          return JsonTable(
                            //c.items.toJson(),
                            controller.items.length == 0
                                ? []
                                : jsonDecode(controller.jsonRes()),
                            //showColumnToggle: true,
                            tableCellBuilder: (value) {
                              // return Container(
                              //   height: 50.0,
                              //   child: Text('${value}',
                              //       ),
                              // );
                              return Container(
                                margin: const EdgeInsets.all(0.0),
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                ),
                                child: Text('${value.trim()}'),
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

                  // SizedBox(
                  //   height: 10.0,
                  // ),
                ],
              )
            : Center(
                child: Text(
                  getPrettyJSONString(controller.items.toJson()),
                ),
              ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     heroTag: "btnStock",
      //     child: Icon(Icons.grid_on),
      //     onPressed: () {
      //       controller.getAllPosts();
      //       //setState(
      //       //   () {
      //       toggle = !toggle;
      //       // },
      //       //);
      //     }),
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
        title: Text("${row['sfaadocno']}-${row['imaal003']}"),
      ),
      body: Text(row.toString()),
    );
  }
}
