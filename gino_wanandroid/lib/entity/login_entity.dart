class LoginEntity {
  LoginEntityData? data;
  int? errorCode;
  String? errorMsg;

  LoginEntity({this.data, this.errorCode, this.errorMsg});

  LoginEntity.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'] != null ? new LoginEntityData.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}

class LoginEntityData {
  bool? admin;
  List<Null>? chapterTops;
  int? coinCount;
  List<Null>? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  LoginEntityData(
      {this.admin,
        this.chapterTops,
        this.coinCount,
        this.collectIds,
        this.email,
        this.icon,
        this.id,
        this.nickname,
        this.password,
        this.publicName,
        this.token,
        this.type,
        this.username});

  LoginEntityData.fromJson(Map<String, dynamic> json) {
    admin = json['admin'];
    if (json['chapterTops'] != null) {
      chapterTops = <Null>[];
      json['chapterTops'].forEach((v) {
        // chapterTops!.add(new Null.fromJson(v));
      });
    }
    coinCount = json['coinCount'];
    if (json['collectIds'] != null) {
      collectIds = <Null>[];
      json['collectIds'].forEach((v) {
        // collectIds!.add(new Null.fromJson(v));
      });
    }
    email = json['email'];
    icon = json['icon'];
    id = json['id'];
    nickname = json['nickname'];
    password = json['password'];
    publicName = json['publicName'];
    token = json['token'];
    type = json['type'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['admin'] = admin;
    if (this.chapterTops != null) {
      // data['chapterTops'] = this.chapterTops!.map((v) => v.toJson()).toList();
    }
    data['coinCount'] = this.coinCount;
    if (this.collectIds != null) {
      // data['collectIds'] = this.collectIds!.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    data['password'] = this.password;
    data['publicName'] = this.publicName;
    data['token'] = this.token;
    data['type'] = this.type;
    data['username'] = this.username;
    return data;
  }
}
