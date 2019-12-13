class Item {
  int id;
  String item;
  bool check;

  Item({this.id, this.item, this.check});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item'] = this.item;
    data['check'] = this.check;
    return data;
  }
}
