import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/getcontroller/mycontroller.dart';

class DependecyController extends GetxController {

  var teacher = Teacher();

  void convertToUpperCase() {
    //转换成大写
    teacher.name.value = teacher.name.value.toUpperCase();
  }
}