

abstract class StockService {

  Future<List> getStockListByMaterial(String material
      /*NetworkManager networkManager*/);

  Future<List> getStockListByMaterialWithLocation(String material
      , String location);

  Future<List> getStockListByLocation(int ent, List workOrderNum,
      String location);

  String here();
}