import 'package:gino_wanandroid/getx_example/app/controller/home_controller/home_controller.dart';
import 'package:gino_wanandroid/getx_example/app/data/provider/api.dart';
import 'package:gino_wanandroid/getx_example/app/data/repository/posts_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository:
          MyRepository(apiClient: MyApiClient()));
    });
  }
}