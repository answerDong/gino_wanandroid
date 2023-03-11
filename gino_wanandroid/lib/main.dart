import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gino_wanandroid/common/sp_utils.dart';
import 'package:gino_wanandroid/pages/project_pages.dart';
import 'package:gino_wanandroid/provider/favorite_provider.dart';
import 'package:gino_wanandroid/provider/theme_provider.dart';
import 'package:gino_wanandroid/res/colors.dart';
import 'package:gino_wanandroid/res/gino_string.dart';

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
      // drawer: showDrawer(),
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
}




