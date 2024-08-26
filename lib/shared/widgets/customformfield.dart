import 'package:flutter/material.dart';
import 'package:visionproject/shared/classes/theme.dart';
import 'package:visionproject/shared/extensions/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatefulWidget {
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
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  const CustomFormField({
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
    this.validator,
    this.onSaved,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.borderColor ?? AppTheme.primaryColor,
        width: widget.borderWidth ?? 1.0,
      ),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: widget.controller.text,
      validator: widget.validator,
      onSaved: widget.onSaved,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              maxLines: widget.obscure == true ? 1 : widget.maxLines,
              obscureText: widget.obscure ?? false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTapOutside: (event) =>
                  {FocusManager.instance.primaryFocus?.unfocus()},
              onChanged: (value) {
                state.didChange(value);
              },
              decoration: InputDecoration(
                isDense: widget.isDense ?? false,
                labelText: widget.labelText,
                hintText: widget.hintText ?? '',
                labelStyle: TextStyle(
                    color: widget.labelColor ?? AppTheme.labelColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                filled: true,
                fillColor: widget.backgroundColor ?? Colors.white,
                border: widget.border ?? _buildBorder(),
                enabledBorder: _buildBorder(),
                focusedBorder: _buildBorder(),
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 16.0),
                suffixIcon: widget.icon?.click(onTap: widget.onPressed),
                errorText: state.errorText,
              ),
              style: TextStyle(
                color: widget.foregroundColor ?? AppTheme.formtextColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
