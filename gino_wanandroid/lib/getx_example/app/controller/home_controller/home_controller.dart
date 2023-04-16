import 'package:get/get.dart';
import '../../data/model/model.dart';
import '../../data/repository/posts_repository.dart';

class HomeController extends GetxController {
  //repository required
  final MyRepository repository;
  HomeController({required this.repository}) : assert(repository != null);

  //use o snippet getfinal para criar está variável
  final _postsList = <MyModel>[].obs;
  get postList => this._postsList.value;
  set postList(value) => this._postsList.value = value;
  ///função para recuperar todos os posts
  getAll(){
    repository.getAll().then( (data){ this.postList = data; } );
  }
}