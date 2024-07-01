class Foods {
  String? id;
  String? name;
  String? description;
  String? plan_id;


  Foods({this.id, this.name, this.description, this.plan_id});

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "description": description, "plan_id": plan_id};

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        id: json['id'].toString(),
        name: json['name'],
        description: json['description'],
        plan_id: json['plan_id'].toString(),
      );
}
