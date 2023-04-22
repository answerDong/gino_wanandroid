import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/binding/bindinghomecontroller.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/binding/bindingmycontroller.dart';

class AllControllerBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<BindingMyController>(() => BindingMyController());
    Get.lazyPut<BindingHomeController>(() => BindingHomeController());
  }
}