class Package {
  int? id;
  String? name;

  Package({this.id, this.name});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}
