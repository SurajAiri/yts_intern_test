import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Map<String, dynamic> tryJsonDecode(String source) {
  try {
    return jsonDecode(source);
  } catch (e) {
    return {};
  }
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
