import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final prefixIcon;
  final bool obscureText;
  final TextEditingController textEditingController;

  const CustomInputField(
      {@required this.label,
      @required this.prefixIcon,
      this.obscureText = false,
      this.textEditingController})
      : assert(label != null),
        assert(prefixIcon != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 200, right: 200, top: 10, bottom: 10),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(AppPadding.editTextPadding),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.12),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.12),
            ),
          ),
          hintText: label,
          hintStyle: TextStyle(
            color: AppColors.editTextColor,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.editTextColor,
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
