class ProjectEntity {
  List<ProjectEntityData>? data;
  int? errorCode;
  String? errorMsg;

  ProjectEntity({this.data, this.errorCode, this.errorMsg});

  ProjectEntity.fromJson(Map<dynamic, dynamic> json) {
    if (json['data'] != null) {
      data = <ProjectEntityData>[];
      json['data'].forEach((v) {
        data!.add(new ProjectEntityData.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}

class ProjectEntityData {
  List<String>? articleList;
  String? author;
  List<String>? children;
  int? courseId;
  String? cover;
  String? desc;
  int? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  int? order;
  int? parentChapterId;
  int? type;
  bool? userControlSetTop;
  int? visible;

  ProjectEntityData(
      {this.articleList,
        this.author,
        this.children,
        this.courseId,
        this.cover,
        this.desc,
        this.id,
        this.lisense,
        this.lisenseLink,
        this.name,
        this.order,
        this.parentChapterId,
        this.type,
        this.userControlSetTop,
        this.visible});

  ProjectEntityData.fromJson(Map<String, dynamic> json) {
    if (json['articleList'] != null) {
      articleList = [];
      json['articleList'].forEach((v) {
        // articleList!.add(new String.fromJson(v));
      });
    }
    author = json['author'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        // children!.add(new Null.fromJson(v));
      });
    }
    courseId = json['courseId'];
    cover = json['cover'];
    desc = json['desc'];
    id = json['id'];
    lisense = json['lisense'];
    lisenseLink = json['lisenseLink'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    type = json['type'];
    userControlSetTop = json['userControlSetTop'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articleList != null) {
      // data['articleList'] = this.articleList!.map((v) => v?.toJson()).toList();
    }
    data['author'] = this.author;
    if (this.children != null) {
      // data['children'] = this.children!.map((v) => v?.toJson()).toList();
    }
    data['courseId'] = this.courseId;
    data['cover'] = this.cover;
    data['desc'] = this.desc;
    data['id'] = this.id;
    data['lisense'] = this.lisense;
    data['lisenseLink'] = this.lisenseLink;
    data['name'] = this.name;
    data['order'] = this.order;
    data['parentChapterId'] = this.parentChapterId;
    data['type'] = this.type;
    data['userControlSetTop'] = this.userControlSetTop;
    data['visible'] = this.visible;
    return data;
  }
}