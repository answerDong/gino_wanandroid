import 'package:flutter/material.dart';
import 'package:gino_wanandroid/common/toast_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'articledetail_pages.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

///关于页面
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _list = <String>[
    "dio: ^5.0.2",
    "dio_cookie_manager: 2.1.0",
    "cookie_jar: ^3.0.1",
    "fluttertoast: ^8.2.1",
    "shared_preferences: ^2.0.18",
    "easy_refresh: ^3.3.1",
    "card_swiper: ^2.0.4",
    "share_plus: ^6.3.1",
    "webview_flutter: ^4.0.6",
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text("关于项目"),
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
            actions: <Widget>[
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_horiz),
                offset: const Offset(100, 100),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: "1",
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('分享'),
                    ),
                  ),
                  const PopupMenuDivider(), //分割线
                  const PopupMenuItem<String>(
                    value: "2",
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('设置'),
                    ),
                  ),
                ],
                tooltip: "点击弹出菜单",
                onSelected: (String result) {
                  print(result);
                  switch (result) {
                    case "1":
                    //需要重启，不然会有 MissingPluginException(No implementation found for method getAll on channel plugins.flutter.io/share)异常
                      Share.share(
                          '【玩安卓Flutter版】\nhttps://github.com/answerDong/gino_wanandroid');
                      break;
                    case "2":
                      ToastUtils.show(msg: "设置");
                      break;
                  }
                },
                onCanceled: () {
                  print("取消");
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              //background: Image.asset("images/a.jpg", fit: BoxFit.fill),
              background: Image.network(
                  "https://avatars3.githubusercontent.com/u/19725223?s=400&u=f399a2d73fd0445be63ee6bc1ea4a408a62454f5&v=4",
                  fit: BoxFit.cover),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 800.0,
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "gino_wanandroid V1.0",
                        style:
                        TextStyle(fontSize: 25, fontFamily: 'mononoki'),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            "Github ：",
                            style: TextStyle(fontSize: 18),
                            textDirection: TextDirection.rtl,
                          ),
                          GestureDetector(
                            child: const Text(
                              "gino_wanandroid",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationStyle:
                                  TextDecorationStyle.solid,
                                  fontSize: 18,
                                  color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetail(
                                      title: "gino_wanandroid",
                                      url:
                                      "https://github.com/answerDong/gino_wanandroid"),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            "掘金 ：",
                            style: TextStyle(fontSize: 18),
                            textDirection: TextDirection.rtl,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: const Text(
                                "https://juejin.cn/user/492173609147502",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationStyle:
                                    TextDecorationStyle.solid,
                                    fontSize: 18,
                                    color: Colors.blue),
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () {
                                WebViewPlatform.instance = WebWebViewPlatform();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleDetail(
                                        title: "掘金：吉诺",
                                        url:
                                        "https://juejin.cn/user/492173609147502"),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "用到的库：",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListView.builder(
                      itemCount: _list.length,
                      shrinkWrap: true,
                      //禁掉ListView的滑动，跟CustomScrollView滑动冲突
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int position) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Text(
                            _list[position].toString(),
                            style: const TextStyle(fontFamily: 'mononoki'),
                          ),
                        );
                      },
                    ),
                    const Divider(),
                  ],
                ),
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
