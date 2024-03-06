class User {
  int? id;
  String? token;
  String? name;

  User({this.id, this.token, this.name});

  User.dbFromJson(Map<String, dynamic> json) {
    id = json["id"];
    token = json['token'];
    name = json['name'];
  }

  User.fromJson(Map<String, dynamic> json) {
    token = json['data']['token'];
    name = json['data']['name'];
  }
}
