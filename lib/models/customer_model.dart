class Customer {
   int? id;
  String? name;
  String? username;
  String? mobile;
  String? address;
  String? area;
  String? package;
  String? amount;

  Customer({this.id,this.name,this.username,this.mobile,this.address,this.area,this.package,this.amount});

  Customer.dbFromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    username = json['username'];
    mobile = json['mobile'];
    address = json['address'];
    area = json['area']['name'];
    package = json['package']['name'];
    amount = json['amount'];
  }

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    mobile = json['mobile'];
    address = json['address'];
    area = json['area']?['name'];
    package = json['package']?['name'];
    amount = json['amount'];
  }
}