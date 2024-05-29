class Plans {
  String? id;
  String? name;
  String? duration;
  String? description;
  String? frequency;
  String? ngoal_id;
  String? plan_category_id;

  Plans(
      {this.id,
      this.name,
      this.duration,
      this.description,
      this.frequency,
      this.ngoal_id,
      this.plan_category_id});

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "duration": duration,
        "frequency": frequency,
        "ngoal_id": ngoal_id,
        "plan_category_id": plan_category_id
      };

  factory Plans.fromJson(Map<String, dynamic> json) => Plans(
        id: json['id'].toString(),
        name: json['name'],
        description: json['description'],
        duration: json['duration'].toString(),
        frequency: json['frequency'].toString(),
        ngoal_id: json['ngoal_id'].toString(),
        plan_category_id: json['plan_category_id'].toString(),
      );
}
