import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/getxwidget/getviewcontroller.dart';

//缓存controller 很少用到   报错，影响不大 先不使用
class GetWidgetExample extends GetWidget<GetViewCountController> {

  @override
  Widget build(BuildContext context) {

    // Get.put(GetViewCountController());
    // Get.create(() => GetViewCountController());

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX GetView"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
              "count的值为:  ${controller?.count}",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30
              ),
            )),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text("点我加1"))
          ],
        ),
      ),
    );
  }

}