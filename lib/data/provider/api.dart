import 'dart:convert';

import 'package:demo_getx/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:vexana/vexana.dart';

const baseUrl =
    'http://192.168.0.184:8081/kanbanApi/';
const devBaseUrl =
    'http://192.168.0.62:8080/kanbanApi/';

class MyApiClient {
  final http.Client httpClient;
  INetworkManager networkManager;
  MyApiClient({ this.httpClient});


  bool isLoading = false;
  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json'
  };


}
