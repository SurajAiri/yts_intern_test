import 'dart:math';

import 'package:flutter/material.dart';

class TodoModel {
  late int id;
  late String todo;
  late bool completed;
  late int userId;
  TimeOfDay time = TimeOfDay.now();
  bool isToday = true;

  TodoModel({
    required this.todo,
    this.id = 0,
    this.userId = 0,
    this.isToday = true,
    this.completed = false,
    TimeOfDay? time,
  }) {
    if (time != null) this.time = time;
  }

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
    Random r = Random();
    time = TimeOfDay(hour: r.nextInt(24), minute: 60);
    if (!completed) isToday = r.nextBool();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    data['isToday'] = isToday;
    data['time'] = time;
    return data;
  }
}
