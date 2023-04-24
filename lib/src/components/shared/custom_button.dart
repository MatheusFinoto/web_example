import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.color,
      this.height,
      this.fontSize,
      this.textColor,
      this.child});

  final VoidCallback? onPressed;
  final String title;
  final double? fontSize;
  final double? height;
  final MaterialColor? color;
  final Color? textColor;
  final Widget? child;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height ?? 40,
        child: ElevatedButton(
            onPressed: widget.onPressed,
            onHover: (value) {
              setState(() {
                _onHover = value;
              });
            },
            style: ElevatedButton.styleFrom(
              shadowColor: widget.color ?? MyColors.primary,
              backgroundColor: widget.color == null
                  ? (_onHover ? MyColors.primary[800] : MyColors.primary)
                  : (_onHover ? widget.color![800] : widget.color),
              textStyle: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: widget.fontSize ?? 16,
                  fontWeight: FontWeight.bold),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
            ),
            child: widget.child ??
                AutoSizeText(
                  maxLines: 1,
                  widget.title.toUpperCase(),
                  style: TextStyle(
                    color: widget.textColor ?? Colors.white,
                  ),
                )));
  }
}
