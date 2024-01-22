import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_test/src/controllers/add_todo_controller.dart';
import 'package:intern_test/src/controllers/todo_controller.dart';
import 'package:intern_test/src/view/widgets/action_button.dart';
import 'package:intern_test/src/view/widgets/input_field.dart';
import 'package:intern_test/utils/constants.dart';
import 'package:intern_test/utils/utility.dart';
import 'package:intern_test/utils/validator.dart';

class AddTodoBottomSheet extends GetView<AddTodoController> {
  AddTodoBottomSheet({
    super.key,
    required AddTodoController controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: kPagePadding,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          "Add A Task",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        InputField(
                          controller: controller.titleController,
                          hintText: "Title",
                          validator: Validator.validateRequiredFields,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text(
                              "Hour",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 25),
                            ElevatedButton(
                              onPressed: controller.pickTime,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 6,
                                ),
                              ),
                              child: Obx(
                                () => Text(
                                  formatTimeOfDay(controller.time.value),
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Obx(
                              () => Switch.adaptive(
                                value: controller.isToday.value,
                                onChanged: (value) {
                                  controller.setIsToday(value);
                                },
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const SizedBox(height: 16),
                        ActionButton(
                          backgroundColor: Colors.black,
                          title: controller.isLoading.value
                              ? "Processing..."
                              : "Done",
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.addTodo,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "If you disable today, the task will be considered as Tomorrow.",
                          style: TextStyle(color: Colors.black45),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
