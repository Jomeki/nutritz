class Evaluations {
  String? id;
  String? alcohol_intake;
  String? sleep_hours;
  String? allergies;
  String? allergy_description;
  String? activity_level;
  String? user_id;
  String? ngoal_id;

  Evaluations(
      {this.id,
      this.alcohol_intake,
      this.sleep_hours,
      this.allergies,
      this.allergy_description,
      this.activity_level,
      this.user_id,
      this.ngoal_id});

  Map<String, dynamic> toJson() => {
        "alcohol_intake": alcohol_intake,
        "sleep_hours": sleep_hours,
        "allergies": allergies,
        if(allergies.toString()=='YES')"allergy_description": allergy_description,
        "activity_level": activity_level,
        "user_id": user_id,
        "ngoal_id": ngoal_id
      };

  factory Evaluations.fromJson(Map<String, dynamic> json) => Evaluations(
        id: json['id'].toString(),
        alcohol_intake: json['alcohol_intake'],
        sleep_hours: json['sleep_hours'],
        allergies: json['allergies'],
        allergy_description: json['allergy_description'],
        activity_level: json['activity_level'],
        user_id: json['user_id'].toString(),
        ngoal_id: json['ngoal_id'].toString(),
      );
}
