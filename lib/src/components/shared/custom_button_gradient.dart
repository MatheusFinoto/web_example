import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CustomButtonGradient extends StatelessWidget {
  const CustomButtonGradient(
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
  final Color? color;
  final Color? textColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
            gradient: onPressed == null
                ? null
                : const LinearGradient(
                    colors: [orange300, pink500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onPressed,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: child ??
                      AutoSizeText(
                        maxLines: 1,
                        title.toUpperCase(),
                        style: TextStyle(
                            color: textColor ?? Colors.white,
                            fontSize: fontSize ?? 16,
                            fontWeight: FontWeight.bold),
                      ),
                ),
              )),
        ));
  }
}
