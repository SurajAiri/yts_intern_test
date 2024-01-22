import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

Map<String, dynamic> tryJsonDecode(String source) {
  try {
    return jsonDecode(source);
  } catch (e) {
    return {};
  }
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  // Custom function to format TimeOfDay without using DateTime
  String period = timeOfDay.hour < 12 ? 'AM' : 'PM';
  int hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
  String minute = timeOfDay.minute.toString().padLeft(2, '0');
  return '$hour:$minute $period';
}

void showMyToast(String msg, {bool isError = false}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.grey[200],
      textColor: isError ? Colors.white : Colors.black87,
      fontSize: 16.0);
}
