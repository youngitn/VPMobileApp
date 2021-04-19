import 'package:demo_getx/data/model/model.dart';
import 'package:demo_getx/data/repository/posts_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class DetailsController extends GetxController {

  final MyRepository repository;
  DetailsController({@required this.repository}) : assert(repository != null);

  final _post = MyModel().obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;


  editar(post){
    print('editar');
  }
  delete(id){
    print('deletar');
  }
}