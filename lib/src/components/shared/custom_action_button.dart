import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton(
      {super.key,
      required this.onTap,
      required this.iconData,
      this.color,
      this.iconColor,
      this.imgPath,
      this.description,
      this.gradient});

  final VoidCallback? onTap;
  final IconData iconData;
  final Color? color;
  final Color? iconColor;
  final String? imgPath;
  final String? description;
  final bool? gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: gradient == true
                    ? const LinearGradient(
                        colors: [orange300, pink500],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                    : null,
                color: color ?? Colors.green.withOpacity(0.4),
                borderRadius: BorderRadius.circular(50)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: imgPath != null
                        ? Image.asset(
                            scale: 2.5,
                            imgPath!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.scaleDown,
                          )
                        : Icon(
                            iconData,
                            color: iconColor ?? Colors.white,
                            size: 40,
                          ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 10),
          )
          // Row(
          //   children: [
          //     Container(
          //       child: Expanded(
          //         child: Text(description ?? ''),
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
