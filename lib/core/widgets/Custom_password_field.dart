import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        hintText: 'كلمة المرور',
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObscured,
        onSaved: (value) {},
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          child: isObscured
              ? const Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffc9cecf),
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Color(0xffc9cecf),
                ),
        ));
  }
}
