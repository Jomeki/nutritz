import 'package:nutriapp/Models/plans.dart';

class CompletedPlans {
  String? id;
  String? user_id;
  String? plan_id;
  Plans? plan;

  CompletedPlans(
      {this.id, this.user_id, this.plan_id, this.plan});

  Map<String, dynamic> toJSON() => {'user_id': user_id, 'plan_id': plan_id};

  factory CompletedPlans.fromJSON(Map<String, dynamic> json) => CompletedPlans(
      id: json['id'].toString(),
      user_id: json['user_id'].toString(),
      plan_id: json['plan_id'].toString(),
      plan: Plans.fromJson(json['plan'])
  );
}
