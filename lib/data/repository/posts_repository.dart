import 'package:demo_getx/data/provider/api.dart';
import 'package:meta/meta.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({@required this.apiClient}) : assert(apiClient != null);

  // getAll() {
  //   return apiClient.getAll();
  // }
  //
  // getId(id) {
  //   return apiClient.getId(id);
  // }
}

