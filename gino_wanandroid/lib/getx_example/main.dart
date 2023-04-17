import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/ui/android/home/home_page.dart';

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
     GetMaterialApp(
      title: "Snackbar",
      home: Scaffold(
        appBar: AppBar(title: const Text("snack-bar"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async {
                // Get.to(
                //   Home(),
                //   //以全屏dialog显示
                //   fullscreenDialog: true,
                //   //缩放透明效果
                //   transition: Transition.zoom,
                //   duration: Duration(milliseconds: 1000),
                //   //进出跳动动画
                //   curve: Curves.bounceInOut
                // );
                // Get.to(Home(),arguments: "main 传递数据");
                var data = await Get.to(Home());
                print("接收到的数据是 $data");
              }, child: const Text("Show snack-bar"))
            ],
          ),
        ),
      ),
    )
  
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
