import 'package:flutter/foundation.dart';

class Category{

  String? id;
  String? title;
  String? description;


  Category({this.id, this.title, this.description});

  Map<String,dynamic> toJson()=>{
    "title": "Food based ",
    "description": "Plan in this category will be based on foods e.g Groundnuts"
  };

  factory Category.fromJson(Map<String,dynamic> json)=>Category(
    id: json['id'].toString(),
    title: json['title'],
    description: json['description'],
  );


}