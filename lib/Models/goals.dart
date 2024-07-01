class Goals {
  String? id;
  String? name;
  String? description;

  Goals({this.id, this.name, this.description});

  @override
  String toString() {
    return name!;
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "description": description};

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description']);
}
