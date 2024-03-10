class Voucher {
  int? id;
  String? name;
  String? amount;
  int? status;
  String? paid;

  Voucher({this.id,this.name,this.amount,this.status,this.paid});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['customer']['name'];
    amount = json['customer']['amount'];
    status = json['status'];
    paid = json['paid_at'];
  }
}