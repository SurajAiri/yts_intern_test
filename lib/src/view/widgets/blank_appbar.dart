import 'package:flutter/material.dart';

class BlankAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlankAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      // title: const Text(
      //   "Back",
      //   style: TextStyle(color: Colors.grey),
      // ),
      iconTheme: const IconThemeData(color: Colors.grey),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
