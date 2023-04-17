import 'package:flutter/material.dart';
import 'package:get/get.dart';

//黑白主题变更
class BWTheme extends StatelessWidget {
  const BWTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: "Snackbar",
      home: Scaffold(
        appBar: AppBar(title: const Text("snack-bar"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                // Get.snackbar("snackbar title", "this will be snackbar message",
                // snackPosition: SnackPosition.BOTTOM,
                // titleText: const Text("Another Title"),
                // messageText: const Text("Another Message",style: TextStyle(color: Colors.white),));
                Get.bottomSheet(Container(
                  child: Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.wb_sunny_outlined),
                        title: Text('亮主题'),
                        onTap: () => {Get.changeTheme(ThemeData.light())},
                      ),
                      ListTile(
                        leading: Icon(Icons.wb_sunny),
                        title: Text('暗主题'),
                        onTap: () => {Get.changeTheme(ThemeData.dark())},
                      )
                    ],
                  ),
                ),barrierColor: Colors.greenAccent.shade100
                    ,backgroundColor: Colors.purpleAccent,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2.0
                        )
                    ),
                    enableDrag: true);
              }, child: const Text("Show snack-bar"))
            ],
          ),
        ),
      ),
    );
  }
}
