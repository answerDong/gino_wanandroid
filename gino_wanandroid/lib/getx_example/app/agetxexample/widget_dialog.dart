import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Get.defaultDialog();
                },
                child: Text("显示 Dialog"))
          ],
        ),
      ),
    );
  }
}