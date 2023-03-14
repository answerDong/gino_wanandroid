import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gino_wanandroid/common/net_api.dart';
import 'package:gino_wanandroid/common/toast_utils.dart';
import 'package:gino_wanandroid/entity/tree_entity.dart';
import 'package:gino_wanandroid/http/http_utils.dart';
import 'package:gino_wanandroid/res/colors.dart';

///体系页面
class TreePage extends StatefulWidget {
  const TreePage({Key? key}) : super(key: key);

  @override
  State<TreePage> createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  List<Data> _datas =[];
  final ScrollController _scrollController = ScrollController();
  int _panelIndex = 0; //展开下标
  final List<IconData> _icons = [
    Icons.star_border,
    Icons.child_care,
    Icons.cloud_queue,
    Icons.ac_unit,
    Icons.lightbulb_outline,
  ];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      //当前位置==最大滑动范围 表示已经滑动到了底部
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ToastUtils.show( msg: "滑动到了底部");
        // do something
        //getMoreData();
      }
    });

    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        //指示器颜色
        color: Theme.of(context).primaryColor,
        //指示器显示时距顶部位置
        displacement: 40,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: ExpansionPanelList(
            //开关动画时长
            animationDuration: Duration(milliseconds: 500),
            //开关回调
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _panelIndex = panelIndex;
                // _datas[panelIndex].isExpanded = !isExpanded;
              });
            },
            //内容区
            children: _datas.map<ExpansionPanel>((Data treeData) {
              return ExpansionPanel(
                //标题
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(
                      treeData?.name as String,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    //取随机icon
                    leading: Icon(_icons[Random().nextInt(_icons.length)]),
                  );
                },
                //展开内容
                body: Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListView.builder(
                    itemCount: treeData.children?.length,
                    itemBuilder: (BuildContext context, int position) {
                      return getRow(position, treeData);
                    },
                  ),
                ),
                //是否展开
                // isExpanded: treeData.isExpanded,
              );
            }).toList(),
          ),
        ),
        //下拉刷新回调
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            ToastUtils.show( msg: "下拉刷新");
            // do something
            //getData();
          });
        },
      ),
    );
  }

  Widget getRow(int i, Data treeData) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ListTile(
          title: Text(
            treeData.children?[i].name as String,
            style: const TextStyle(color: GinoColors.color_999),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: GinoColors.color_999,
          ),
        ),
      ),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>
        //         TreeDetailPage(panelIndex: _panelIndex, index: i),
        //   ),
        // );
      },
    );
  }

  void getHttp() async {
    try {
      var response = await HttpUitls.getInstance().get(NewApi.TREE);
      Map dataMap = json.decode(response.toString());
      var treeEntity = TreeEntity.fromJson(dataMap);
      //遍历赋值isExpanded标识，默认全部合并
      if (treeEntity.data != null) {
        for (int i = 0; i < treeEntity.data!.length; i++) {
          // treeEntity.data?[i]. = false;
        }
      }
      setState(() {
        _datas = treeEntity.data!;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
