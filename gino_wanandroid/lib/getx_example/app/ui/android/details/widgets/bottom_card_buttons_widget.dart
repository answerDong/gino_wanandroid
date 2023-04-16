// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gino_wanandroid/getx_example/app/controller/details_controller/details_controller.dart';
//
// class CardBottomButtonsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         GetX<DetailsController>(
//           builder: (_) {
//             return RaisedButtonCustomWidget(
//               icon: Icons.delete_outline,
//               onPressed: _.delete(_.post.id),
//               text: 'Delete',
//             );
//           },
//         ),
//         GetX<DetailsController>(
//           builder: (_) {
//             return ElevatedButton.icon(onPressed: _.editar(_.post), icon: Icons(Icons.edit), label: Text("Editar"));
//
//               // RaisedButtonCustomWidget(
//               // icon: Icons.edit,
//               // onPressed: _.editar(_.post),
//               // text: 'Editar',
//             // );
//           },
//         )
//       ],
//     );
//   }
// }
