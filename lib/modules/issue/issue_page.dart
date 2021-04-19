import 'dart:convert';
import 'dart:ui';

import 'package:demo_getx/modules/stock/stock_controller.dart';
import 'package:demo_getx/modules/work_order/work_order_controller.dart';
import 'package:demo_getx/widget/text_inpute_field.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_table/json_table.dart';

import 'issue_controller.dart';

@immutable
// ignore: must_be_immutable
class IssuePage extends GetView<IssueController> {
  bool toggle = true;

  //final scrollController = ScrollController();

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
    WorkOrderController workOrderController = controller.workOrderController;
    StockController stockController = controller.stockController;

    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      appBar: AppBar(
        title: Text('發料作業'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: toggle
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Obx(
                                  () => Text(
                                    '目前庫位: ${controller.locationName()}',
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontFamily: 'NotoSansTC',

                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: TextInputField(
                              hintText: ' 請輸入工單號碼',
                              labelText: '工單號碼 *',
                              textEditingController:
                                  workOrderController.textController,
                              onSubmitted: (value) {
                                if (controller.workOrderNum.isEmpty) {
                                  workOrderController.items.assignAll([]);
                                  Get.snackbar('系統訊息', '工單號不可為空');
                                }
                                workOrderController
                                    .getWorkOrderListByWorkOrderNum();
                              },

                              ///非同步會有時間差需使用async/await
                              theFunctionOfAfterSanQRCode: () {
                                workOrderController
                                    .getWorkOrderListByWorkOrderNum();
                              },
                              onPressed: () {
                                if (workOrderController
                                    .textController.text.isEmpty) {
                                  workOrderController.items.assignAll([]);
                                  Get.snackbar('系統訊息', '工單號不可為空');
                                }
                                workOrderController
                                    .getWorkOrderListByWorkOrderNum();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: ExpansionTileCard(
                              baseColor: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              title: Text('顯示工單備料清單'),
                              leading: Obx(
                                () => CircleAvatar(
                                  child: Text(
                                      '${workOrderController.items.length}'),
                                ),
                              ),
                              children: [
                                Container(
                                  height: Get.height - 250,
                                  child: SingleChildScrollView(
                                    //controller: scrollController,
                                    padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      child: Obx(() {
                                        if (workOrderController.items.length ==
                                            0) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [Text('暫無資料')],
                                          );
                                        }

                                        return JsonTable(
                                          //c.items.toJson(),
                                          workOrderController.items.length == 0
                                              ? []
                                              : jsonDecode(workOrderController
                                                  .jsonRes.value),
                                          //showColumnToggle: true,
                                          tableCellBuilder: (value) {
                                            // return Container(
                                            //   height: 50.0,
                                            //   child: Text('${value}',
                                            //       ),
                                            // );
                                            return Container(
                                              margin: const EdgeInsets.all(0.0),
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blueAccent),
                                              ),
                                              child: Text('${value.trim()}'),
                                            );
                                          },
                                          columns: columns,

                                          allowRowHighlight: true,
                                          rowHighlightColor: Colors.yellow[500]
                                              .withOpacity(0.7),
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
                            )),
                      ],
                    ),
                    SizedBox(height: 20,)
                    ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.only(
                              top: 0,
                              bottom: 20,
                            ),
                            child: TextInputField(
                              hintText: ' 請輸入料號',
                              labelText: '料號 *',
                              textEditingController:
                                  stockController.textController,
                              onSubmitted: (value) {
                                if (controller.material.isEmpty) {
                                  stockController.items.assignAll([]);
                                  Get.snackbar('系統訊息', '料號不可為空');
                                }
                                stockController.getStockListByMaterial();
                              },

                              ///非同步會有時間差需使用async/await
                              theFunctionOfAfterSanQRCode: () {
                                stockController.getStockListByMaterial();
                              },
                              onPressed: () {
                                if (controller.material.isEmpty) {
                                  stockController.items.assignAll([]);
                                  Get.snackbar('系統訊息', '料號不可為空');
                                }
                                stockController.getStockListByMaterial();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    getPrettyJSONString(workOrderController.items.toJson()),
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
      ),
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
