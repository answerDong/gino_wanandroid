import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/controller/details_controller/details_controller.dart';
import 'package:gino_wanandroid/getx_example/app/data/provider/api.dart';
import 'package:gino_wanandroid/getx_example/app/data/repository/posts_repository.dart';


class DetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository:
          MyRepository(apiClient: MyApiClient()));
    });
  }

}