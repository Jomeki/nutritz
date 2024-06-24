
import 'package:nutriapp/Models/foods.dart';

class GoalsFood {
  String? id;
  String? goals_id;
  String? food_id;
  Foods? food;

  GoalsFood(
      {this.id ,this.goals_id, this.food_id, this.food});

  Map<String, dynamic> toJSON() => {'goals_id':goals_id,'food_id':food_id};

  factory GoalsFood.fromJSON(Map<String, dynamic> json)  => GoalsFood(
    id: json['id'].toString(),
    goals_id: json['goals_id'].toString(),
    food_id: json['food_id'].toString(),
    food: Foods.fromJson(json['fooddata'])
  );
}