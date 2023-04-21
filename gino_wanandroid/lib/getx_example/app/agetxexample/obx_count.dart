import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxObxCount extends StatelessWidget {
  RxInt count = RxInt(0);
  // var count = Rx<double>(0);
  // var count = 0.obs;

  void increment() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Obx---计数器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
              "count的值为: $count",
              style: TextStyle(color: Colors.red, fontSize: 30),
            )),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  increment();
                },
                child: Text("点我加1"))
          ],
        ),
      ),
    );
  }
}
