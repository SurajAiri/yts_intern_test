import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/controllers/add_todo_controller.dart';
import 'package:intern_test/src/controllers/todo_controller.dart';
import 'package:intern_test/src/view/features/todo/widgets/add_todo_bottom_sheet.dart';
import 'package:intern_test/src/view/features/todo/widgets/todo_tile.dart';
import 'package:intern_test/utils/assets_path.dart';
import 'package:intern_test/utils/constants.dart';
import 'package:lottie/lottie.dart';

class TodoScreen extends GetView<TodoController> {
  TodoScreen({super.key});

  @override
  final controller = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTodoController controller = Get.put(AddTodoController());
          Get.bottomSheet(AddTodoBottomSheet(
            controller: controller,
          )).whenComplete(() {
            Future.delayed(
              const Duration(milliseconds: 200),
              () {
                Get.delete<AddTodoController>();
              },
            );
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPagePadding,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                          kDemoImgUrl,
                          width: 42,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi ${controller.loginController.user?.firstName ?? "Unknown"},",
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "Let's track your todo tasks...",
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.logout();
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 24,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Obx(() => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : buildTodayTodoPart()),
                Obx(
                  () => (controller.tomorrowTodo.isNotEmpty)
                      ? buildTomorrowTodoPart()
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTomorrowTodoPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tomorrow",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Obx(
          () => ListView.builder(
            itemCount: controller.tomorrowTodo.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TodoTile(
                todo: controller.tomorrowTodo.toList()[index],
                onChanged: (value) {
                  if (value == null) return;
                  controller.toggleTask(index, value);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildTodayTodoPart() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextButton(
              onPressed: controller.toggleShowCompletedTasks,
              child: Obx(
                () => Text(
                  controller.showCompletedTasks.value
                      ? "Hide Completed"
                      : "Show Completed",
                ),
              ),
            )
          ],
        ),
        Obx(
          () => (controller.todayTodo.isEmpty)
              ? LottieBuilder.asset(
                  apNoItemAnim,
                  // height: 80,
                  width: MediaQuery.of(Get.context!).size.width * 0.8,
                  // repeat: false,
                )
              : ListView.builder(
                  itemCount: controller.todayTodo.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      todo: controller.todayTodo.toList()[index],
                      onChanged: (value) {
                        if (value == null) return;
                        controller.toggleTask(index, value);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
