import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/styles.dart';
import '../../styles/text_define.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? stringError;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool showError;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? prefixPadding;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.keyboardType,
    this.stringError,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.inputFormatters,
    this.focusNode,
    this.obscureText = false,
    this.showError = true,
    this.textInputAction,
    this.prefixPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool haveErr = stringError != null && stringError!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText ?? '', style: TextDefine.t1_B.copyWith()),
        const SizedBox(height: 10),
        TextField(
          focusNode: focusNode,
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: style ?? TextDefine.t1_R.copyWith(color: neutral00),
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          cursorColor: neutral00,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(1),
              isDense: true,
              hintText: hintText,
              labelStyle: TextStyle(color: theme.primary03),
              errorText: haveErr ? '' : null,
              errorStyle: const TextStyle(height: 0),
              errorMaxLines: 1,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              prefixIconConstraints: const BoxConstraints(minHeight: 0),
              suffixIconConstraints: const BoxConstraints(minHeight: 0)),
        ),
        const Divider(color: neutral05),
        if (haveErr && showError)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: theme.error04),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Text(
                    stringError!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: theme.error04,
                    ),
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
