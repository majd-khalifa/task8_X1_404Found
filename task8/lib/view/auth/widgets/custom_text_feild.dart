// widgets/custom_text_field.dart
// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task8/core/constants/app_color.dart';
import 'package:task8/core/constants/text_style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool isPassword;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withOpacity(0.5), width: 1),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        onChanged: widget.onChanged,
        enabled: widget.enabled,

        style: AppTextStyles.textStyle16.copyWith(color: AppColors.textPrimary),

        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 16.w, right: 16.w, top: 13.h),

          hintText: widget.hintText,

          hintStyle: AppTextStyles.textStyle16.copyWith(
            color: AppColors.textMuted,
          ),

          prefixIcon: Icon(
            widget.prefixIcon,
            color: AppColors.iconColor,
            size: 20,
          ),

          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.iconColor,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
