import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/controllers/todo_controller.dart';
import 'package:intern_test/src/model/todo_model.dart';

class AddTodoController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  RxBool isToday = true.obs;
  Rx<TimeOfDay> time = TimeOfDay.now().obs;
  GlobalKey<FormState> formKey = GlobalKey();
  final TodoController todoController = Get.find<TodoController>();

  void setIsToday(bool value) {
    isToday.value = value;
  }

  Future<void> pickTime() async {
    var picked = await showTimePicker(
      context: Get.context!,
      initialTime: time.value,
    );
    if (picked != null) time.value = picked;
  }

  void addTodo() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;
    todoController.addTodo(
      TodoModel(
        todo: titleController.text,
        time: time.value,
        isToday: isToday.value,
      ),
    );
    isLoading.value = true;
    Get.back();
  }
}
