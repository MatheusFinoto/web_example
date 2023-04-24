import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class CustomButtonOutline extends StatefulWidget {
  const CustomButtonOutline(
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
  State<CustomButtonOutline> createState() => _CustomButtonOutlineState();
}

class _CustomButtonOutlineState extends State<CustomButtonOutline> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height ?? 40,
        child: OutlinedButton(
            onPressed: widget.onPressed,
            onHover: (value) {
              setState(() {
                _onHover = value;
              });
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: widget.color ?? MyColors.primary),
              backgroundColor: widget.color == null
                  ? (_onHover ? MyColors.primary[300] : Colors.transparent)
                  : (_onHover ? widget.color![300] : Colors.transparent),
              textStyle: TextStyle(
                  color: widget.color ?? MyColors.primary,
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
                    color: widget.color ?? MyColors.primary,
                  ),
                )));
  }
}
