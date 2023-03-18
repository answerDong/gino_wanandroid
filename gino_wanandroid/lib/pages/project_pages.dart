import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gino_wanandroid/common/net_api.dart';
import 'package:gino_wanandroid/entity/projectlist_entity.dart';
import 'package:gino_wanandroid/http/http_utils.dart';
import 'package:gino_wanandroid/res/colors.dart';
import '../entity/project_entity.dart';

///项目页面
class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> with TickerProviderStateMixin {
  late TabController _controller; //tab控制器
  int _currentIndex = 0; //选中下标
  List<ProjectEntityData> _datas = []; //tab集合
  List<ProjectListEntityDataDatas> _listDatas = []; //内容集合

  int _page = 1;

  @override
  void initState() {
    super.initState();

    //初始化controller
    _controller = TabController(vsync: this, length: 0);
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        //控制器
        controller: _controller,
        //选中的颜色
        labelColor: Theme.of(context).primaryColor,
        //选中的样式
        labelStyle: const TextStyle(fontSize: 16),
        //未选中的颜色
        unselectedLabelColor: GinoColors.color_666,
        //未选中的样式
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        //下划线颜色
        indicatorColor: Theme.of(context).primaryColor,
        //是否可滑动
        isScrollable: true,
        //tab标签
        tabs: _datas.map((ProjectEntityData choice) {
          return Tab(
            text: choice.name,
          );
        }).toList(),
        //点击事件
        onTap: (int i) {
          print(i);
        },
      ),
      body: TabBarView(
        controller: _controller,
        children: _datas.map<Widget>((ProjectEntityData data) {
          return EasyRefresh(
              header: const ClassicHeader(),
              footer: const ClassicFooter(),
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _page = 1;
                  });
                  getHttp();
                });
              },
              onLoad: () async {
                await Future.delayed(Duration(seconds: 1), () async {
                  setState(() {
                    _page++;
                  });
                  // getMoreData();
                });
              },
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return getRow(index);
                    },
                    childCount: _datas.length,
                  ))
                ],
              ));
        }).toList(),
      ),
    );
  }

  void getHttp() async {
    try {
      var response = await HttpUitls.getInstance().get(NewApi.PROJECT);
      Map userMap = json.decode(response.toString());
      var projectEntity = ProjectEntity.fromJson(userMap);
      //
      setState(() {
        _datas = projectEntity.data!;
        _controller = TabController(vsync: this, length: _datas.length);
      });
      //
      getDetail();
      //
      // //controller添加监听
      _controller.addListener(() => _onTabChanged());
    } catch (e) {
      print(e);
    }
  }

  /// tab改变监听
  _onTabChanged() {
    if (_controller.index.toDouble() == _controller.animation?.value) {
      //赋值 并更新数据
      setState(() {
        _currentIndex = _controller.index;
      });
      getDetail();
    }
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.network(_listDatas[i]?.envelopePic as String),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _listDatas[i]?.title as String,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          _listDatas[i]?.desc as String,
                          style: const TextStyle(
                              fontSize: 14, color: GinoColors.color_666),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  _listDatas[i]?.niceDate as String,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                _listDatas[i]?.author as String,
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.right,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        //点击item跳转到详情
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ArticleDetail(
        //         title: _listDatas[i].title, url: _listDatas[i].link),
        //   ),
        // );
      },
    );
  }

  void getDetail() async {
    try {
      var data = {"cid": _datas[_currentIndex].id};
      var response = await HttpUitls.getInstance()
          .get("${NewApi.PROJECT_LIST}$_page/json", data: data);
      Map userMap = json.decode(response.toString());
      print("project 详情${"${NewApi.PROJECT_LIST}$_page/json"}");
      print("project 详情${data}");

      var projectListEntity = ProjectListEntity.fromJson(userMap);

      setState(() {
        _listDatas =
            projectListEntity.data?.datas! as List<ProjectListEntityDataDatas>;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
