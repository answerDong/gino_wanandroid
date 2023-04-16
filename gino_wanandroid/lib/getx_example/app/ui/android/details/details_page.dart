import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/controller/details_controller/details_controller.dart';
import 'package:gino_wanandroid/getx_example/app/controller/home_controller/home_controller.dart';



class DetailsPage extends GetView<DetailsController> {

  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: 400,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(32),
            child: GetX<DetailsController>(
              builder: (_) {
                _.post = Get.find<HomeController>();
                return ListView(
                  children: const <Widget>[
                    Text("data",textDirection: TextDirection.rtl,),
                  ],
                );
              },
            )),
      ),
    );
  }
}
