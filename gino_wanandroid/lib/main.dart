import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gino_wanandroid/common/sp_utils.dart';
import 'package:gino_wanandroid/http/http_utils.dart';
import 'package:gino_wanandroid/pages/project_pages.dart';
import 'package:gino_wanandroid/provider/favorite_provider.dart';
import 'package:gino_wanandroid/provider/theme_provider.dart';
import 'package:gino_wanandroid/res/colors.dart';
import 'package:gino_wanandroid/res/gino_string.dart';
import 'package:share_plus/share_plus.dart';

import 'common/net_api.dart';
import 'pages/about_pages.dart';
import 'pages/articledetail_pages.dart';
import 'pages/home_pages.dart';
import 'pages/navi_pages.dart';
import 'pages/tree_pages.dart';

void main() async {
  //进行一些数据的初始化
  WidgetsFlutterBinding.ensureInitialized();

  //初始化
  var theme = ThemeProvider();
  var favorite = FavoriteProvider();
  //sp中获取主题
  int? themeIndex = await SPUils.getInstance.getInt("themeindex");
  // int? themeIndex = 1;
  themeIndex ??= 0;

  runApp(MyApp(themeIndex));
}


class MyApp extends StatelessWidget {
  
  final int _themeindex;
  
  // MyApp(this._themeindex, {super.key});
  // MyApp({super.key});
  const MyApp(this._themeindex, {super.key});

  @override
  Widget build(BuildContext context) {



    var theme;
    return   MaterialApp(
      title: GinoStr.appName,
      theme: ThemeData(
        // This is the theme of your application.
        //除了primaryColor，还有brightness、iconTheme、textTheme等等可以设置
        //   primaryColor: GinoColors.themeColor[theme.value ?? _themeindex]["primaryColor"],
        //   primaryColorDark: GinoColors.themeColor[theme.value ?? _themeindex]["primaryColorDark"],
        //   accentColor: GinoColors.themeColor[theme.value ?? _themeindex]["colorAccent"]
        primaryColor: GinoColors.themeColor["primaryColor"],
        primaryColorDark: GinoColors.themeColor["primaryColorDark"],

//              primaryColor: GinoColors.colorPrimary,
//              primaryColorDark: GinoColors.colorPrimaryDark,
//              accentColor: GinoColors.colorAccent,
//              dividerColor: GinoColors.dividerColor,
      ),
      home: MyHomePage(title: GinoStr.appName),
    );
  }
}

//界面
class MyHomePage extends StatefulWidget {

  final String title;

  const MyHomePage({Key? key,required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //当前选中的页签
  int _selectedIndex = 0;
  String title = GinoStr.appName;
  var _pageController = PageController(initialPage: 0);

  //底部导航栏的页面
  var pages = <Widget>[HomePage(),TreePage(),NaviPage(),ProjectPage(),];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar设置
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(onPressed: () {
            //跳转到搜索页
          }, tooltip: GinoStr.tooltip_search,icon: const Icon(Icons.search))
        ],
      ),
      body: PageView.builder(
        onPageChanged: _pageChange,
          itemCount: pages.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index){
            return pages.elementAt(_selectedIndex);
          },
        ),
      //封装一个底部导航栏
      bottomNavigationBar: myBottomNavigatiorBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: showToast,
        tooltip: '点击选中最后一个',
        child: const Icon(Icons.add, color: Colors.white),
      ),
      drawer: showDrawer(),
    );
  }

  //根据选中页签修改标题
  void _pageChange(int index) {
    setState(() {
      _selectedIndex = index;
      //根据下标修改标题
      switch (index) {
        case 0:
          title = GinoStr.appName;
          break;
        case 1:
          title = GinoStr.tree;
          break;
        case 2:
          title = GinoStr.navi;
          break;
        case 3:
          title = GinoStr.project;
          break;
      }
    });
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        //ListView padding 不为空的时候，Drawer顶部的状态栏就不会有灰色背景
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            //头像
            currentAccountPicture: GestureDetector(
              //圆形头像
              child: ClipOval(
                child: Image.network(
                    'https://p3-passport.byteimg.com/img/user-avatar/e197bee8fce9515962b5e19874c70ce4~100x100.awebp'),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            //其他头像
            otherAccountsPictures: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.stars,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetail(
                            title: "点个star",
                            url:
                            "https://github.com/answerDong/gino_wanandroid"),
                      ),
                    );
                  })
            ],
            accountName: Text(
              GinoStr.proName,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            accountEmail: Text(GinoStr.github),
          ),

          ///功能列表
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text("我的收藏"),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              // var response = await HttpUitls.getInstance()
              //     .get("${NewApi.COLLECT_LIST}0/json");
              // print("收藏数据"+response);
              // Navigator.of(context).pop();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CollectPage()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text("切换主题"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pop();
              showThemeDialog();
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("我要分享"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pop();
              Share.share('【玩安卓Flutter版】\nhttps://github.com/answerDong/gino_wanandroid');
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("关于项目"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              //先关闭再跳转
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.block),
            title: Text("退出"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              //关闭drawer
              Navigator.of(context).pop();
              showLogoutDialog();
            },
          ),
        ],
      ),
    );
  }

  Widget myBottomNavigatiorBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: GinoStr.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.filter_list),
          label: GinoStr.tree,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.low_priority),
          label: GinoStr.navi,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.apps),
          label: GinoStr.project,
        ),
      ],
      //当前选中下标
      currentIndex: _selectedIndex,
      //显示模式
      type: BottomNavigationBarType.fixed,
      //选中颜色
      fixedColor: Theme.of(context).primaryColor,
      //点击事件
      onTap: _onItemTapped,
    );
  }

  //导航栏点击事件
  void _onItemTapped(int index) {
    //bottomNavigationBar 和 PageView 关联
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: "选中最后一个",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: GinoColors.colorPrimaryDark,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    _onItemTapped(3);
  }

  ///退出弹框
  void showLogoutDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('确认退出吗？'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('取消', textDirection: TextDirection.rtl,style: TextStyle(color: GinoColors.primaryText)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('确定',textDirection: TextDirection.rtl,),
              onPressed: () {
                //退出
                HttpUitls.getInstance().get(NewApi.LOGOUT);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ///主题dialog
  void showThemeDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('切换主题'),
          content: SingleChildScrollView(
            child: Container(
              //包含ListView要指定宽高
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: GinoColors.themeColor.keys.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.only(bottom: 15),
                      color: GinoColors.themeColor[position]["primaryColor"],
                    ),
                    onTap: () async {
                      //没有实现，改成用provider比较懒，懒得弄了。之后使用get实现。
                      // Provide.value<ThemeProvide>(context).setTheme(position);
                      // //存储主题下标
                      // SharedPreferences sp = await SharedPreferences.getInstance();
                      // sp.setInt("themeIndex", position);
                      // Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('关闭',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}




