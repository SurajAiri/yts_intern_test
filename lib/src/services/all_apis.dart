import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intern_test/utils/api_callback_handler.dart';
import 'package:intern_test/utils/api_callback_listener.dart';
import 'package:intern_test/utils/utility.dart';

import '../model/auth_user_model.dart';
import '../../utils/endpoints.dart';
import '../model/todo_model.dart';

part 'login.dart';
part 'todo_list.dart';

class AllApis {
  static Future<AuthUserModel?> loginWithEmail({
    required String email,
    required String password,
    ApiCallListener? listener,
  }) async {
    return _loginWithEmail(
      username: email,
      password: password,
      listener: listener,
    );
  }

  static Future<List<TodoModel>> fetchTodoList({
    ApiCallListener? listener,
  }) async {
    return _fetchTodoList(
      listener: listener,
    );
  }
}
