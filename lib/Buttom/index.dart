import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../../styles/text_define.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String text;
  final num height;
  final Alignment alignment;
  final bool fullWidth;
  final Color? backgroundColor;
  final Color? disableColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? side;
  final bool enabled;
  final Color? textColor;
  final BoxBorder? border;

  const Button({
    Key? key,
    required this.onPressed,
    this.child,
    this.height = 54,
    this.alignment = Alignment.center,
    this.fullWidth = true,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.side,
    this.disableColor,
    this.border,
    this.enabled = true,
    this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      child: GestureDetector(
        onTap: enabled ? onPressed : null,
        child: Container(
            decoration: BoxDecoration(
              border: border,
              color: !enabled
                  ? disableColor ?? theme.primary05
                  : backgroundColor ?? neutral00,
              borderRadius: borderRadius ?? BorderRadius.circular(100),
            ),
            child: fullWidth == true
                ? Align(
                    alignment: alignment,
                    child: child ??
                        Text(text,
                            style: TextDefine.t1_B.copyWith(
                                color: textColor ??
                                    (!enabled
                                        ? theme.neutral09
                                        : theme.neutral10))),
                  )
                : child),
      ),
    );
  }
}
