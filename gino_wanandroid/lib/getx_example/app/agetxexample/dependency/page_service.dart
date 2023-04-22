import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'service.dart';

class GetXServiceExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Service"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.find<Service>().getCounter();
                },
                child: Text("点我加1 看日志"))
          ],
        ),
      ),
    );
  }
}