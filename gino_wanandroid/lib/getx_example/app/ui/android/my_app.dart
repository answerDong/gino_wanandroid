
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';

class MyApp extends StatelessWidget {
  final bool isFirst;

  const MyApp({Key? key, required this.isFirst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: '项目开始',
      navigatorObservers: [GetXRouterObserver()],
      unknownRoute: Routes.unknownPage,

      /// 通过使用initialRoute来保证绑定的操作
      initialRoute: isFirst ? Routes.welcome : Routes.splash,
      getPages: Routes.routePage,
      onGenerateRoute: (settings) {
        logger.d(settings.name);
        return null;
      },

      /// 经过初始化的binding,
      initialBinding: AccountBinding(),

      /// 使用Loading动画
      builder: EasyLoading.init(),
      theme: _getCupertinoCurrentTheme(),
    );
  }

  // /// App运行过程中,如果在iOS的设置中更改了亮度模式,还是无法实时进行更改,只能下次运行的时候才能体现变化,体验不好
  // ThemeData _getMaterialCurrentTheme() {
  //   return SchedulerBinding.instance.window.platformBrightness;
  // }

  CupertinoThemeData _getCupertinoCurrentTheme() {
    return const CupertinoThemeData(
        barBackgroundColor: Colors.white, brightness: Brightness.light);
  }
}