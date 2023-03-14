import 'package:flutter/material.dart';

///项目页面
class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {

  @override
  void initState() {
    super.initState();


    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void getHttp() async {
    // try {
    //   var response = await HttpUtil().get(Api.PROJECT);
    //   Map userMap = json.decode(response.toString());
    //   var projectEntity = ProjectEntity.fromJson(userMap);

    //   setState(() {
    //     _datas = projectEntity.data;
    //     _controller = TabController(vsync: this, length: _datas.length);
    //   });
    //
    //   getDetail();
    //
    //   //controller添加监听
    //   _controller.addListener(() => _onTabChanged());
    // } catch (e) {
    //   print(e);
    // }
  }
}
