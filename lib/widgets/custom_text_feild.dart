// widgets/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../core/constants/color/app_color.dart';

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
    Key? key,
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
  }) : super(key: key);

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
      decoration: BoxDecoration(
        color: AppColor.inputBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.border.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        onChanged: widget.onChanged,
        enabled: widget.enabled,
        style: TextStyle(
          color: AppColor.textPrimary,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColor.textHint,
            fontSize: 16,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: AppColor.iconColor,
            size: 20,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColor.iconColor,
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