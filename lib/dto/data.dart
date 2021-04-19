
class Data {
  const Data({this.xmdg002, this.pmaal004,this.imaal003});

  final String pmaal004;
  final String xmdg002;
  final String imaal003;

  factory Data.fromJson(Map<String, dynamic> json) {

    return Data(
        pmaal004: json['pmaal004'],
        xmdg002: json['xmdg002'],
        imaal003: json['imaal003']

    );

  }
// bool running() {
//   bool ok = services.isNotEmpty;
//   // for (ServiceInfo service in services) {
//   //   if (!service.running) {
//   //     ok = false;
//   //   }
//   // }
//
//   return ok;
// }
//
// bool notAvailable() {
//   return services.isEmpty;
// }
      }
