import 'dart:ui';
import 'package:get/get.dart';

class MessagesController extends GetxController {

  void  changeLanguage(String languageCode, String countryCode) {
    var locate = Locale(languageCode,countryCode);
    //通过getx更新配置
    Get.updateLocale(locate);
  }
}