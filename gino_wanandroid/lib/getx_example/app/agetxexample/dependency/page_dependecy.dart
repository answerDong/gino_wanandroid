import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gino_wanandroid/getx_example/app/agetxexample/dependency/dependecycontroller.dart';

class DependecyInjectionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 即使不使用控制器实例也会被创建
    // tag将用于查找具有标签名称的实例
    // 控制器在不使用时被处理，但如果永久为真，则实例将在整个应用程序中保持活动状态
    DependecyController myController = Get.put(DependecyController(), permanent: true);
    // DependecyController myController = Get.put(DependecyController(), tag: "instancel", permanent: true);

    // 实例将在使用时创建
    // 它类似于'permanent'，区别在于实例在不被使用时被丢弃
    // 但是当它再次需要使用时，get 将重新创建实例
    // Get.lazyPut(()=> DependecyController());
    // Get.lazyPut(()=> DependecyController(), tag: "instancel");

    // Get.put 异步版本
    // Get.putAsync<DependecyController>(() async  => await DependecyController());

    // 每次都将返回一个新的实例
    // Get.create<DependecyController>(() => DependecyController());

    return Scaffold(
      appBar: AppBar(
        title: Text("GetXController"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // 实例使用的tag创建
                  // Get.find<DependecyController>(tag: 'instancel');

                  Get.find<DependecyController>();
                },
                child: Text("别点我"))
          ],
        ),
      ),
    );
  }
}