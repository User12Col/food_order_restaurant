class Table {
  final int? id;
  final String? location;
  final int? status;
  final String? created_at;
  final String? updated_at;

  Table(
      {this.id, this.location, this.status, this.created_at, this.updated_at});

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
        id: json['id'],
        location: json['location'],
        status: json['status'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'location':location,
      'status':status,
      'created_at':created_at,
      'updated_at':updated_at,
    };
  }
}
