import 'package:demo_getx/bindings/get_data_binding.dart';
import 'package:demo_getx/modules/dispatch_list/dispatch_list_page.dart';
import 'package:demo_getx/modules/dynamic_list/simple_table.dart';
import 'package:demo_getx/modules/get_data/get_data_page.dart';
import 'package:demo_getx/modules/home/vp_home_page.dart';
import 'package:demo_getx/modules/inject/inject_simple_binding.dart';
import 'package:demo_getx/modules/inject/inject_simple_page.dart';
import 'package:demo_getx/modules/issue/issue_page.dart';

import 'package:demo_getx/modules/location_setting/locating_setting_page.dart';
import 'package:demo_getx/modules/nav/nav_page.dart';
import 'package:demo_getx/modules/nav/simple_page.dart';
import 'package:demo_getx/modules/qr_scaner/qr_scanner_page.dart';
import 'package:demo_getx/modules/stock/stock_page.dart';
import 'package:demo_getx/modules/work_order/work_order_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => VpHomePage(),
    ),
    GetPage(
      name: Routes.DISPATCH_LIST,
      page: () => DispatchListPage(),
      binding: InjectSimpleBinding(),
    ),
    GetPage(
      name: Routes.NAV,
      page: () => NavPage(),
    ),
    GetPage(
      name: Routes.NAV_SIMPLE,
      page: () => NavSimplePage(),
    ),
    GetPage(
      name: "${Routes.NAV_SIMPLE}/:title",
      page: () => NavSimplePage(),
    ),
    GetPage(
      name: Routes.INJECT,
      page: () => InjectSimplePage(),
      binding: InjectSimpleBinding(),
    ),
    GetPage(
      name: Routes.GET_DATA,
      page: () => GetDataPage(),
      binding: GetDataBinding(),
    ),
    GetPage(
      name: Routes.DYNAMIC_PAGE,
      page: () => DynamicListPage(),
      binding: GetDataBinding(),
    ),
    GetPage(
      name: Routes.STOCK,
      page: () => StockPage(),
      binding: GetDataBinding(),
    ),
    GetPage(
      name: Routes.WORK_ORDER,
      page: () => WorkOrderPage(),
      binding: GetDataBinding(),
    ),
    GetPage(
      name: Routes.ISSUE,
      page: () => IssuePage(),
      binding: GetDataBinding(),
    ),
    GetPage(
      name: Routes.QR_SCANNER,
      page: () => QrScannerPage(),
      binding: GetDataBinding(),
    ),
  GetPage(
  name: Routes.LOCATION_SETTING_PAGE,
  page: () => LocationSettingPage(),
  binding: GetDataBinding(),
  ),
  ];
}
