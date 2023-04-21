import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxNavigationForNamed extends StatelessWidget {
  GlobalKey<NavigatorState> _navKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX NavigationForNamed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Get.toNamed("/my");
                },
                child: Text("跳转到首页"))
          ],
        ),
      ),
    );
  }
}