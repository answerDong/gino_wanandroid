import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 应用程序的生命周期内对一个类实例进行绝对的持久化，那么就可以使用GetxService
class Service extends GetxService {
  Future<void> getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = (prefs.getInt("counter") ?? 0) + 1;
    print("count 的值为: $count");
    await prefs.setInt("counter", count);
  }
}