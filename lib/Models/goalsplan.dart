
import 'package:nutriapp/Models/plans.dart';

class GoalsPlan {
  String? id;
  String? goal_id;
  String? plan_id;
  Plans? plan;

  GoalsPlan(
      {this.id ,this.goal_id, this.plan_id, this.plan});

  Map<String, dynamic> toJSON() => {'goals_id':goal_id,'plan_id':plan_id};

  factory GoalsPlan.fromJSON(Map<String, dynamic> json)  => GoalsPlan(
    id: json['id'].toString(),
    goal_id: json['goal_id'].toString(),
    plan_id: json['plan_id'].toString(),
    plan: Plans.fromJson(json['plansdata'])
  );
}