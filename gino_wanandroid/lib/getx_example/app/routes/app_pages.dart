import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/bindings/details_binding.dart';
import 'package:gino_wanandroid/getx_example/app/ui/android/details/details_page.dart';
import '../ui/android/home/home_page.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page:()=> HomePage(),),
    GetPage(name: Routes.DETAILS, page:()=> DetailsPage(), binding: DetailsBinding()), //dependencias de details via rota
  ];
}