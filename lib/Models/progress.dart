class Progress {
  String? userdailydata;
  String? userweeklydata;
  String? userdailymonthly;
  List<ProgressData>? userdata;

  Progress(
      {this.userdailydata,
      this.userweeklydata,
      this.userdailymonthly,
      this.userdata});

  Map<String, dynamic> toJson() => {
        "userdata": userdata?.map((e) => e.toJson()).toList(),
        "userdailydata": 0,
        "userweeklydata": 2,
        "userdailymonthly": 0
      };

  factory Progress.fromJSON(Map<String, dynamic> json) => Progress(
        userdailydata: json['userdailydata'].toString(),
        userweeklydata: json['userweeklydata'].toString(),
        userdailymonthly: json['userdailymonthly'].toString(),
        userdata: json['userdata'] != null
            ? (json['userdata'] as List)
                .map((data) => ProgressData.fromJSON(data))
                .toList()
            : [],
      );
}

class ProgressData {
  String? id;
  String? user_id;
  String? plan_id;
  String? progress_category;

  ProgressData({this.id, this.user_id, this.plan_id, this.progress_category});

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': user_id,
        'plan_id': plan_id,
        'progress_category': progress_category,
      };

  factory ProgressData.fromJSON(Map<String, dynamic> json) => ProgressData(
        id: json['id'].toString(),
        user_id: json['user_id'].toString(),
        plan_id: json['plan_id'].toString(),
        progress_category: json['progress_category'],
      );
}
