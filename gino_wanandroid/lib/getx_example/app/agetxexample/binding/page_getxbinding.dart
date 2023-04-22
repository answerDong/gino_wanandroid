import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/binding/bindingmycontroller.dart';
import 'package:gino_wanandroid/pages/home_pages.dart';

import '../getcontroller/page_getxcontroller.dart';

class GetXBindingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetXBinding"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
              "计数器的值为 ${Get.find<BindingMyController>().count}",
              style: TextStyle(color: Colors.red, fontSize: 30),
            )),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Get.find<BindingMyController>().increment();
                },
                child: Text("点击加1")
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Get.to(GetXControllerExample());

                  // Get.toNamed("/bHome");

                  // Get.to(BHome(), binding: BHomeControllerBinding());
                },
                child: Text("跳转去首页")
            ),
          ],
        ),
      ),
    );
  }
}