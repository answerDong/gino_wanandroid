import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mylifecyclecontroller.dart';

class GetXControllerLifecycleMethodExample extends StatelessWidget {

  MyLifecycleController myLifecycleController = Get.put(MyLifecycleController());

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("GetXControllerLifecycleMethod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<MyLifecycleController>(
              initState: (data) => myLifecycleController.increment(),
              dispose: (_) => myLifecycleController.cleanTask(),
              builder: (controller) {
                return Text(
                  "计数器值为: ${myLifecycleController.count}",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}