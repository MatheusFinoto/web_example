import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';
import 'card_color_theme.dart';

class RowColor extends StatelessWidget {
  const RowColor({super.key, required this.colors});

  final List<Map<String, dynamic>> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 0.5, color: Colors.black26)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: colors.map((e) {
            bool last = e == colors[colors.length - 1];
            return Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardColorTheme(
                        color: e['color'], title: "${e['name']}"),
                  ),
                  last
                      ? Container()
                      : const SizedBox(
                          width: 32,
                        ),
                ],
              ),
            );
          }).toList(),

          // children: [
          //   Expanded(
          //     child: CardColor(color: MyColors.primary, title: "Primary"),
          //   ),
          //   SizedBox(
          //     width: 32,
          //   ),
          //   Expanded(
          //     child: CardColor(color: MyColors.secondary, title: "Secondary"),
          //   ),
          // ],
        ),
      ),
    );
  }
}
