import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinningWidget extends StatelessWidget {
  const SpinningWidget({super.key, this.message = ""});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message != "")
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xC8000000),
              ),
            ),
          if (message != "") const SizedBox(height: 10),
          SpinKitCubeGrid(
            color: Colors.lightBlue[300],
          ),
        ],
      ),
    );
  }
}
