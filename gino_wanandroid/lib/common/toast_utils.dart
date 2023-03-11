import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///Toast封装
class ToastUtils {
  static show({
    required String msg,
  }) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
