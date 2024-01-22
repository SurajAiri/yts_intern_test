import 'package:flutter/material.dart';
import 'package:intern_test/src/model/todo_model.dart';
import 'package:intern_test/utils/utility.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
    this.onChanged,
  });
  final TodoModel todo;
  final Function(bool? value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          todo.isToday
              ? Checkbox(
                  value: todo.completed,
                  onChanged: onChanged,
                )
              : const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 8,
                ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.todo,
                  style: TextStyle(
                    decoration: todo.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: Color(0xff737373),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  formatTimeOfDay(todo.time),
                  style: TextStyle(
                    decoration: todo.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: Color(0xff737373),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
