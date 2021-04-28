import 'dart:convert';


import 'package:demo_getx/data/todo_fetch.dart';
import 'package:demo_getx/modules/qr_scaner/qr_scanner_controller.dart';
import 'package:demo_getx/modules/stock/stock_by_location_page.dart';
import 'package:demo_getx/widget/text_inpute_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:json_table/json_table.dart';

import 'muti_work_order_issue_controller.dart';

@immutable
class MutiWorkOrderIssuePage extends GetView<MutiWorkOrderIssueController> {
  MutiWorkOrderIssueController controller =
      Get.put(MutiWorkOrderIssueController());
  QrScannerController qrScannerController = Get.find();
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
  // String token =
  //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ5b3VuZ3RpbjEwMTdAZ21haWwuY29tIiwibmFtZSI6InlvdW5ndGluMTAxNyIsImlhdCI6MTYxNzA4MzIzMS4xNDMsImlzcyI6Imh0dHBzOi8vaGFzdXJhLmlvL2xlYXJuLyIsImh0dHBzOi8vaGFzdXJhLmlvL2p3dC9jbGFpbXMiOnsieC1oYXN1cmEtYWxsb3dlZC1yb2xlcyI6WyJ1c2VyIl0sIngtaGFzdXJhLXVzZXItaWQiOiJ5b3VuZ3RpbjEwMTdAZ21haWwuY29tIiwieC1oYXN1cmEtZGVmYXVsdC1yb2xlIjoidXNlciIsIngtaGFzdXJhLXJvbGUiOiJ1c2VyIn0sImV4cCI6MTYxNzE2OTYzMX0.98gsF4L3J0JItyfrbgr-Di2Ubf8OIuEL7yzamUwSpBE";

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: controller.initailizeClient(''),
      child: CacheProvider(
        child: Scaffold(
          //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          appBar: AppBar(
            title: Text('工單查詢'),
            actions: [
              GestureDetector(
                onTap: () {
                  if (controller.workOrderList().length == 0) {
                    Get.snackbar('系統訊息', '無工單輸入');
                  }
                  Get.snackbar('系統訊息', '取得所有工單在目前庫位中可備料列表');
                  //sleep(Duration(seconds: 5));
                  Get.to(() => StockByLocationPage());
                },
                child: Container(
                  width: 80,
                  color: Colors.red[200],
                  alignment: FractionalOffset.center,
                  //color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.skip_next),
                      Text(
                        '下一步',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                          controller
                              .addWordListItem(controller.textController.text);
                          Get.rawSnackbar(
                              message: controller.textController.text);
                        },
                        textEditingController: controller.textController,
                        hintText: ' 請輸入工單號碼',
                        labelText: '工單號碼 *',
                        onPressed: () async {
                          if (controller.textController.text.isEmpty) {
                            controller.items.assignAll([]);
                            Get.snackbar('系統訊息', '工單號不可為空');
                          }
                        },
                        theFunctionOfAfterSanQRCode: () async {
                          if (controller.textController.text.isNotEmpty) {
                            await controller.addWordListItem(
                                controller.textController.text);
                            Get.rawSnackbar(
                                message: controller.textController.text);
                          }
                        },
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            itemCount: controller.workOrderList().length,
                            //padding: const EdgeInsets.only(top: 10.0),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          controller.removeWordListItem(index);
                                          print(index);
                                        },
                                      ),
                                      title: Text(
                                          '工單號碼: ${controller.workOrderList()[index]} '),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        //height: Get.height-200,
                        // child: SingleChildScrollView(
                        //   controller: scrollController,
                        //   padding: EdgeInsets.all(0.0),
                        //   child: Container(
                        //     child: Obx(() {
                        //       if (controller.workOrderList().length == 0) {
                        //         return Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [Text('暫無資料')],
                        //         );
                        //       }
                        //
                        //       return ListView.builder(
                        //         itemCount: controller.workOrderList().length,
                        //         itemBuilder: (context, index) {
                        //           return new ListTile(
                        //             title: new Text(
                        //                 '${controller.workOrderList()[index]}'),
                        //           );
                        //         },
                        //       );
                        //     }),
                        //   ),
                        // ),
                      ),
                      Expanded(
                        child: Query(
                            options: QueryOptions(
                              documentNode: gql(TodoFetch.fetchAll),
                              variables: {"inag001": "3130152200"},
                            ),
                            builder: (QueryResult result,
                                {VoidCallback refetch, FetchMore fetchMore}) {
                              print('builder*************');
                              //var refetchQuery = refetch;
                              print(result.data);
                              if (result.hasException) {
                                return Text(result.exception.toString());
                              }
                              if (result.loading) {
                                print('Loading*************');
                                return Text('Loading*************');
                              }
                              final List<LazyCacheMap> todos =
                                  (result.data['getInag'] as List<dynamic>)
                                      .cast<LazyCacheMap>();

                              return ListView.builder(
                                itemCount: todos.length,
                                itemBuilder: (context, index) {
                                  dynamic responseData = todos[index];
                                  return Text(
                                      '${responseData['inag001']}-${responseData['inag004']}');
                                },
                              );
                            }),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      getPrettyJSONString(controller.items.toJson()),
                    ),
                  ),
          ),
        ),
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
