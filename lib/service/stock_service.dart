import 'package:vexana/vexana.dart';

abstract class StockService{

  Future<List> getStockListByMaterial(String material/*NetworkManager networkManager*/);
  Future<List> getStockListByLocation(int ent,List workOrderNum,String location);
  String here();
}