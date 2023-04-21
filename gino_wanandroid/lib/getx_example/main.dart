import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/getcontroller/page_getcontrollerworkers.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/getcontroller/page_getxcontroller.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/getcontroller/page_getxcontrollerlifecycle.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/getcontroller/page_getxcontrolleruniqueid.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/obx_count.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/page_navigation.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/page_navigationhome.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/widget_bottomsheet.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/widget_dialog.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/widget_snackbar.dart';
import 'package:gino_wanandroid/getx_example/app/ui/android/home/home_page.dart';

import 'app/agetxexample/page_navigationnameto.dart';

void main() {
  //判断是否是第一次启动
  // final isFirst = await AccountManager().getIsFirstLaunch();
  // runApp(MyApp(isFirst: isFirst));
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
      //snackbar
      // GetxSnackbar()
      //dialog
      // GetMaterialApp(
      //   title: "getxdialog",
      //   home: GetxDialog(),
      // )
      //BottomSheet
      // GetMaterialApp(
      //   title: "getxdialog",
      //   home: GetxBottomSheet(),
      // )
      //Navigation跳转
      // GetMaterialApp(
      //   title: "GetX",
      //   home: GetxNavigation(),
      // )
      //toName跳转
      // GetMaterialApp(
      //   title: "GetX",
      //   initialRoute: "/",
      //   defaultTransition: Transition.zoom,
      //   getPages: [
      //     GetPage(name: "/", page: () => GetxNavigation()),
      //     GetPage(name: "/home", page: () => GetxNavigationHome()),
      //     // GetPage(name: "/my", page: () => My(), transition: Transition.rightToLeft)
      //   ],
      //   home: GetxNavigationForNamed(),
      // )
     //obx监听状态值
     //  GetMaterialApp(
     //    title: "obx",
     //    home: GetxObxCount(),
     //  )
     //Controller ui与控制解耦
     GetMaterialApp(
       title: "getx controller",
       //示例
       // home: GetXControllerExample(),
       //init示例
       // home: GetXControllerWorkersExample(),
       //生命周期示例
       // home: GetXControllerLifecycleMethodExample(),
       //单独更新
       home: GetXControllerUniqueIDExample(),
     )


      // GetMaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   initialRoute: Routes.INITIAL, //Rota inicial
      //   initialBinding: HomeBinding(), // dependencias iniciais
      //   theme: appThemeData, //Tema personalizado app
      //   defaultTransition: Transition.fade, // Transição de telas padrão
      //   getPages: AppPages.routes, // Seu array de navegação contendo as rotas e suas pages
      //   home: HomePage(), // Page inicial
      //   locale: Locale('pt', 'BR'), // Língua padrão
      //   translationsKeys: AppTranslation.translations, // Suas chaves contendo as traduções<map>
      // )
      //  GetMaterialApp(
      //   title: "Snackbar",
      //   home: Scaffold(
      //     appBar: AppBar(title: const Text("snack-bar"),),
      //     body: Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           ElevatedButton(onPressed: () async {
      //             // Get.to(
      //             //   Home(),
      //             //   //以全屏dialog显示
      //             //   fullscreenDialog: true,
      //             //   //缩放透明效果
      //             //   transition: Transition.zoom,
      //             //   duration: Duration(milliseconds: 1000),
      //             //   //进出跳动动画
      //             //   curve: Curves.bounceInOut
      //             // );
      //             // Get.to(Home(),arguments: "main 传递数据");
      //             var data = await Get.to(Home());
      //             print("接收到的数据是 $data");
      //           }, child: const Text("Show snack-bar"))
      //         ],
      //       ),
      //     ),
      //   ),
      // )

      );

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。
    // 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，
    // 写在渲染之前MaterialApp组件会覆盖掉这个值。
    const systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// class MyApp1 extends StatelessWidget {
//   final bool isFisrt;
//   const MyApp1({Key? key,required this.isFisrt}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const GetCupertinoApp(
//       title: "Getx app",
//       // unknownRoute: ,
//       initialRoute: isFirst ? Routes.
//     );
//   }
// }
