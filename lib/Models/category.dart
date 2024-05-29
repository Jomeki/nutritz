import 'package:flutter/foundation.dart';

class PlanCategory{

  String? id;
  String? title;
  String? description;


  PlanCategory({this.id, this.title, this.description});

  Map<String,dynamic> toJson()=>{
    "title": "Food based ",
    "description": "Plan in this category will be based on foods e.g Groundnuts"
  };

  factory PlanCategory.fromJson(Map<String,dynamic> json)=>PlanCategory(
    id: json['id'].toString(),
    title: json['title'],
    description: json['description'],
  );


}