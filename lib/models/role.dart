class Role{
  final int? id;
  final String? name;
  final DateTime? created_at;
  final DateTime? updated_at;

  Role({this.id, this.name, this.created_at, this.updated_at});

  factory Role.fromJson(Map<String, dynamic> json){
    return Role(id: json['id'], name: json['name'], created_at: json['created_at'], updated_at: json['updated_at']);
  }
}