import 'package:flutter/material.dart';
import 'package:visionproject/shared/extensions/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool? obscure;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? labelColor;
  final OutlineInputBorder? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Icon? icon;
  final VoidCallback? onPressed;
  final bool? isDense;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.obscure,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.labelColor,
    this.border,
    this.padding,
    this.contentPadding,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.keyboardType,
    this.maxLines,
    this.icon,
    this.onPressed,
    this.isDense,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.borderColor ?? Colors.grey[400]!,
        width: widget.borderWidth ?? 1.0,
      ),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 80.0.h,
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        maxLines: (widget.obscure != null && widget.obscure == true)
            ? 1
            : widget.maxLines,
        obscureText: widget.obscure ?? false,
        decoration: InputDecoration(
          isDense: widget.isDense ?? false,
          labelText: widget.labelText,
          hintText: widget.hintText ?? '',
          labelStyle: TextStyle(
            color: widget.labelColor ?? Colors.grey[600],
          ),
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.white,
          border: widget.border ?? _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16.0),
          suffixIcon: widget.icon?.click(onTap: widget.onPressed),
        ),
        style: TextStyle(color: widget.foregroundColor ?? Colors.grey[600]),
      ),
    );
  }
}
