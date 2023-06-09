import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'countcontroller.dart';

class GetXControllerUniqueIDExample extends StatelessWidget {

  CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Obx---GetXController"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              builder: (controller) {
                return Text(
                  "计数器值为: ${controller.count}",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                );
              },
            ),
            GetBuilder<CountController>(
              //通过id来更新特定的地方
              id: 'gino_count',
              builder: (controller) {
                return Text(
                  "计数器值为: ${controller.count}",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                );
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () => countController.increment(),
                child: Text("增加"))
          ],
        ),
      ),
    );
  }
}