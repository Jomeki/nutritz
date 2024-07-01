import 'package:nutriapp/Models/plans.dart';

class Enrollement {
  String? id;
  String? user_id;
  String? plan_id;
  String? completion_status;
  Plans? plan;

  Enrollement(
      {this.id, this.user_id, this.plan_id, this.completion_status, this.plan});

  Map<String, dynamic> toJSON() => {'user_id': user_id, 'plan_id': plan_id, 'status': completion_status};

  factory Enrollement.fromJSON(Map<String, dynamic> json) => Enrollement(
      id: json['id'].toString(),
      user_id: json['user_id'].toString(),
      plan_id: json['plan_id'].toString(),
      completion_status: json['completion_status'].toString(),
      plan: Plans.fromJson(json['plan'])
  );
}
