import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gino_wanandroid/common/net_api.dart';
import 'package:gino_wanandroid/common/toast_utils.dart';
import 'package:gino_wanandroid/entity/login_entity.dart';
import 'package:gino_wanandroid/http/http_utils.dart';
import 'package:gino_wanandroid/res/colors.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPagePageState();
  }
}

class _LoginPagePageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController controller; //tab控制器

  var tabs = <Tab>[];
  String btnText = "登录";
  String bottomText = "没有账号？注册";
  bool visible = true;
  final GlobalKey<FormState> _key = GlobalKey();
  bool autoValidate = false;
  late String username, password, rePassword;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Theme
            .of(context)
            .primaryColor,
        accentColor: Theme
            .of(context)
            .accentColor,
        primaryColorDark: Theme
            .of(context)
            .primaryColorDark,
      ),
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme
                  .of(context)
                  .accentColor,
              Theme
                  .of(context)
                  .primaryColorDark,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: getBodyView(),
        ),
      ),
    );
  }

  Widget getBodyView() {
    //可滑动布局，避免弹出键盘时会有溢出异常
    return ListView(
      children: <Widget>[
        const SizedBox(height: 80),
        Stack(alignment: Alignment.topCenter, children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(40),
            child: Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  // autovalidate: autoValidate,
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        //键盘类型，即输入类型
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person_outline),
                          labelText: '请输入账号',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "账号不能为空";
                          }
                        },
                        onSaved: (text) {
                          setState(() {
                            username = text!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        //是否显示密码类型
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock_outline),
                          labelText: '请输入密码',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "密码不能为空";
                          }
                        },
                        onSaved: (text) {
                          setState(() {
                            password = text!;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Offstage(
                        offstage: visible,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock_outline),
                                labelText: '请确认密码',
                              ),
                              validator: visible ? null : (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "密码不能为空";
                                }
                              },
                              onSaved: (text) {
                                setState(() {
                                  rePassword = text!;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: MediaQuery
                .of(context)
                .size
                .width / 2 - 35,
            child: Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("lib/res/images/ic_logo.png"),
                  ),
                  boxShadow: [
                    BoxShadow(
                      //左右、上下阴影的距离
                      offset: Offset(0, 0),
                      //阴影颜色
                      color: Colors.grey,
                      //模糊距离
                      blurRadius: 8,
                      //不模糊距离
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 130,
            right: 130,
            child: ElevatedButton(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Theme
                          .of(context)
                          .accentColor,
                      Theme
                          .of(context)
                          .primaryColorDark,
                    ],
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  btnText,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () {
                if (_key?.currentState?.validate() == true) {
                  _key.currentState?.save();
                  print("$username--$password**$rePassword");
                  doRequest();
                } else {
                  setState(() {
                    autoValidate = true;
                  });
                }
              },
            ),

            // RaisedButton(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(50),
            //     ),
            //   ),
            //   elevation: 5,
            //   highlightElevation: 10,
            //   textColor: Colors.white,
            //   padding: EdgeInsets.all(0.0),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(50)),
            //       gradient: LinearGradient(
            //         colors: <Color>[
            //           Theme.of(context).accentColor,
            //           Theme.of(context).primaryColorDark,
            //         ],
            //       ),
            //     ),
            //     padding: EdgeInsets.all(10.0),
            //     child: Text(
            //       btnText,
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ),
            //   onPressed: () {
            //     if (_key.currentState.validate()) {
            //       _key.currentState.save();
            //       print(username + "--" + password + "**" + rePassword);
            //       doRequest();
            //     } else {
            //       setState(() {
            //         autoValidate = true;
            //       });
            //     }
            //   },
            // ),
          ),
        ]),
        GestureDetector(
          child: Text(
            bottomText,
            style: const TextStyle(color: GinoColors.color_fff),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            setState(() {
              if (visible) {
                btnText = "注册";
                visible = false;
                bottomText = "已有账号？登录";
              } else {
                btnText = "登录";
                visible = true;
                bottomText = "没有账号？注册";
              }
            });
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  String? validateUsername(String value) {
    if (value == null || value.isEmpty) {
      return "账号不能为空";
    } else if (value.length < 6) {
      return "账号最少6位";
    }
    return "";
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "密码不能为空";
    } else if (value.length < 6) {
      return "密码最少6位";
    }
    return "";
  }

  String validateRePassword(String value) {
    if (value.isEmpty) {
      return "确认密码不能为空";
    } else if (value.length < 6) {
      return "确认密码最少6位";
    }
//    else if (value != password) return "两次密码不一致";
    return "";
  }

  Future doRequest() async {
    Map<String, String> data;
    if (visible) {
      data = {'username': username, 'password': password};
    } else {
      data = {
        'username': username,
        'password': password,
        'repassword': rePassword
      };
    }

    var response =
    await HttpUitls.getInstance().post(
        visible ? NewApi.LOGIN : NewApi.REGISTER, data: data);
    Map userMap = json.decode(response.toString());
    var userEntity = LoginEntity.fromJson(userMap);
    if (userEntity.errorCode == 0) {
      ToastUtils.show(msg: visible ? "登录成功~" : "注册成功~");
      //跳转并关闭当前页面
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => MyHomePage(title: "",)), (
          route) => false);
    } else {
    ToastUtils.show(msg: userMap['errorMsg']);
    }
  }
}
