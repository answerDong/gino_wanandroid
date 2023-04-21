
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/controller/home_controller/home_controller.dart';


class GetxNavigationHome extends StatelessWidget {
  const GetxNavigationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Text("this is home screen",
              style: TextStyle(color: Colors.purpleAccent,fontSize: 30),),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: () { },
              child: Text('下一屏',style: TextStyle(fontSize: 18)),

            ),
            SizedBox(height: 8,),
            ElevatedButton(
              onPressed: () {
                // Get.back();
                //返回并传递数据
                Get.back(result: '这是home页面的数据');
              },
              child: Text('回到主页面',style: TextStyle(fontSize: 18)),

            ),
            SizedBox(height: 8,),
            Text(
              //get获取传递的数据
              "${Get.arguments}",
              style: TextStyle(color: Colors.green,fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
