import 'package:get/get.dart';
import 'package:intern_test/src/controllers/login_controller.dart';
import 'package:intern_test/src/model/auth_user_model.dart';
import 'package:intern_test/src/model/todo_model.dart';
import 'package:intern_test/src/services/all_apis.dart';
import 'package:intern_test/utils/routes.dart';

class TodoController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool showCompletedTasks = true.obs;
  LoginController loginController = Get.find<LoginController>();

  final RxList<TodoModel> _todayTodo = RxList();
  RxList<TodoModel> get todayTodo => _todayTodo
      .where(
        (element) => !(!showCompletedTasks.value && element.completed),
      )
      .toList()
      .obs;
  RxList<TodoModel> tomorrowTodo = RxList();

  void addTodo(TodoModel value) {
    if (value.isToday) {
      _todayTodo.add(value);
      _todayTodo.sort(_sortTodo);
      _todayTodo.refresh();
    } else {
      tomorrowTodo.add(value);
      tomorrowTodo.refresh();
    }
  }

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    var temp = await AllApis.fetchTodoList();
    for (var v in temp) {
      if (v.isToday) {
        _todayTodo.add(v);
      } else {
        tomorrowTodo.add(v);
      }
    }
    // print(tomorrowTodo.length);
    _todayTodo.sort(_sortTodo);
    tomorrowTodo.sort(_sortTodo);
    isLoading.value = false;
  }

  void toggleShowCompletedTasks() {
    showCompletedTasks.value = !showCompletedTasks.value;
    _todayTodo.sort(_sortTodo);
    _todayTodo.refresh();
  }

  void toggleTask(int index, bool value) {
    // todayTodo[index].completed = value;
    int ind = _todayTodo.indexOf(todayTodo[index]);
    _todayTodo[ind].completed = value;
    _todayTodo.sort(_sortTodo);
    _todayTodo.refresh();
  }

  int _sortTodo(TodoModel a, TodoModel b) {
    // Sort by isToday in descending order
    if (a.isToday != b.isToday) {
      return b.isToday ? -1 : 1;
    }
    // If isToday is the same, sort by completed in descending order
    if (a.completed != b.completed) {
      return b.completed ? -1 : 1;
    }
    // If isToday and completed are the same, sort by time in ascending order
    // return a.time.compareTo(b.time);
    if (a.time.hour != b.time.hour) {
      return a.time.hour > b.time.hour ? 1 : -1;
    }
    return a.time.minute > b.time.minute ? 1 : -1;
  }

  void logout() {
    loginController.logout();
    Get.offAndToNamed(Routes.loginOnboardScreen);
  }
}
