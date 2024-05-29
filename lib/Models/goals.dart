class Goals {
  String? id;
  String? name;
  String? description;

  Goals({this.id, this.name, this.description});

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "description": description};

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
      id: json['id'], name: json['name'], description: json['description']);
}
