import 'package:flutter/material.dart';
import 'package:intern_test/src/view/widgets/input_field.dart';
import 'package:intern_test/utils/validator.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    this.controller,
    this.obscureText = true,
    this.labelText,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.validator = Validator.validatePassword,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hideText = false;
  @override
  void initState() {
    hideText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: widget.controller,
      obscureText: hideText,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      labelText: widget.labelText,
      hintText: widget.hintText,
      // prefixIcon: Icon(
      //   Icons.lock,
      //   color: Theme.of(context).primaryColor,
      //   size: 18,
      // ),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            hideText = !hideText;
          });
        },
        icon: Icon(
          hideText ? Icons.visibility_rounded : Icons.visibility_off,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
      ),
    );
  }
}
