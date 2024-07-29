class FormDataModel {
  int? id;
  DateTime? date;
  DateTime? time;
  String staff;
  String participants;
  String budget;
  String choice;
  String? reason;
  String activity;
  String? noactivity;
  String obj;
  String? noobj;

  FormDataModel({
    this.id,
    this.date,
    this.time,
    required this.staff,
    required this.participants,
    required this.budget,
    required this.choice,
    this.reason,
    required this.activity,
    this.noactivity,
    required this.obj,
    this.noobj,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date?.toIso8601String(),
      'time': time?.toIso8601String(),
      'staff': staff,
      'participants': participants,
      'budget': budget,
      'choice': choice,
      'reason': reason,
      'activity': activity,
      'noactivity': noactivity,
      'obj': obj,
      'noobj': noobj,
    };
  }

  factory FormDataModel.fromMap(Map<String, dynamic> map) {
    return FormDataModel(
      id: map['id'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      time: map['time'] != null ? DateTime.parse(map['time']) : null,
      staff: map['staff'],
      participants: map['participants'],
      budget: map['budget'],
      choice: map['choice'],
      reason: map['reason'],
      activity: map['activity'],
      noactivity: map['noactivity'],
      obj: map['obj'],
      noobj: map['noobj'],
    );
  }
}
