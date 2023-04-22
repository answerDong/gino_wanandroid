import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getviewcontroller.dart';

class GetViewExample extends GetView<GetViewCountController> {

  @override
  Widget build(BuildContext context) {

    Get.put(GetViewCountController());
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