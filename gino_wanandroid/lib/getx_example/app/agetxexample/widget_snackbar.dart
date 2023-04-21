import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxSnackbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GetX Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
                  },
                  child: Text("显示 Snackbar"))
            ],
          ),
        ),
      ),
    );
  }
}
