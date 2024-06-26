class User {
  String? id;
  String? fname;
  String? sname;
  String? full_name;
  String? gender;
  String? dob;
  String? height;
  String? weight;
  String? phone_number;
  String? ngoal_id;
  String? is_evaluated;
  String? blood_group;
  String? password;
  String? password_confirmation;

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
      this.password_confirmation});

  Map<String, dynamic> toRegistration() => {
        "fname": fname,
        "sname": sname,
        "phone_number": phone_number,
        "gender": gender,
        "dob": dob,
        "height": height,
        "ngoal_id": ngoal_id,
        "weight": weight,
        "blood_group": blood_group,
        "is_evaluated": "0",
        "password": password,
        "password_confirmation": password_confirmation
      };
  Map<String, dynamic> toLogin() => {
        "phone_number": phone_number,
        "password": password,
      };

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "sname": sname,
        "phone_number": phone_number,
        "gender": gender,
        "dob": dob,
        "height": height,
        "ngoal_id": ngoal_id,
        "weight": weight,
        "blood_group": blood_group,
        "is_evaluated": is_evaluated
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'].toString(),
        fname: json['fname'],
        sname: json['sname'],
        full_name: "${json['fname']} ${json['sname']}",
        phone_number: json['phone_number'].toString(),
        gender: json['gender'],
        blood_group: json['blood_group'],
        dob: json['dob'].toString(),
        height: json['height'].toString(),
        weight: json['weight'].toString(),
        ngoal_id: json['ngoal_id'].toString(),
        is_evaluated: json['is_evaluated'].toString(),
      );
}
