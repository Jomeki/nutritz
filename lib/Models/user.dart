import 'evaluations.dart';

class User {
  String? id;
  String? fname;
  String? sname;
  String? full_name;
  String? gender;
  String? dob;
  String? height;
  String? weight;
  String? bmi;
  String? phone_number;
  String? ngoal_id;
  String? is_evaluated;
  String? blood_group;
  String? password;
  String? password_confirmation;
  Evaluations? evaluation;

  User(
      {this.id,
      this.fname,
      this.sname,
      this.full_name,
      this.gender,
      this.dob,
      this.height,
      this.weight,
      this.phone_number,
      this.ngoal_id,
      this.is_evaluated,
      this.blood_group,
      this.password,
      this.password_confirmation,
      this.bmi,
      this.evaluation});

  Map<String, dynamic> toRegistration() => {
        "fname": fname,
        "sname": sname,
        "phone_number": phone_number,
        "gender": gender,
        "dob": dob,
        "height": height,
        "bmi": bmi,
        "ngoal_id": ngoal_id,
        "weight": weight,
        "blood_group": blood_group,
        "is_evaluated": "0",
        "password": password,
        "password_confirmation": password_confirmation
      };

  Map<String, dynamic> toUpdateProfile() => {
        "height": height,
        "ngoal_id": ngoal_id,
        "weight": weight,
        "blood_group": blood_group,
      };
  Map<String, dynamic> toLogin() => {
        "phone_number": phone_number,
        "password": password,
      };

  Map<String, dynamic> toJson() => {
        'user': {
          "id": id,
          "fname": fname,
          "sname": sname,
          "phone_number": phone_number,
          "gender": gender,
          "dob": dob,
          "height": height,
          "ngoal_id": ngoal_id,
          "weight": weight,
          "bmi": bmi,
          "blood_group": blood_group,
          "is_evaluated": is_evaluated,
        },
        "evaluation": evaluation?.toJson()
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['user']['id'].toString(),
      fname: json['user']['fname'],
      sname: json['user']['sname'],
      full_name: "${json['user']['fname']} ${json['user']['sname']}",
      phone_number: json['user']['phone_number'].toString(),
      gender: json['user']['gender'],
      bmi: json['user']['bmi'].toString(),
      blood_group: json['user']['blood_group'],
      dob: json['user']['dob'].toString(),
      height: json['user']['height'].toString(),
      weight: json['user']['weight'].toString(),
      ngoal_id: json['user']['ngoal_id'].toString(),
      is_evaluated: json['user']['is_evaluated'].toString(),
      evaluation: json['evaluation'] != null
          ? Evaluations.fromJson(json['evaluation'])
          : null);
}
