class MenuItem{
  final int? id;
  final String? name;
  final String? photo;
  final int? price;
  final int? availability;
  final int? has_bought;
  final int? menu_id;
  final String? created_at;
  final String? updated_at;
  int? quantity;

  MenuItem({this.id, this.name, this.photo, this.price, this.availability, this.has_bought, this.menu_id, this.created_at, this.updated_at, this.quantity});

  factory MenuItem.fromJson(Map<String, dynamic> json){
    return MenuItem(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      price: json['price'],
      availability: json['availability'],
      has_bought: json['has_bought'],
      menu_id: json['menu_id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'name':name,
      'photo':photo,
      'price':price,
      'quantity':quantity,
    };
  }
}

