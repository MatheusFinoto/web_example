import 'package:flutter/material.dart';

class CardColorTheme extends StatelessWidget {
  const CardColorTheme({super.key, required this.title, required this.color});

  final String title;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 124,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color[100],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color[300],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color[600],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color[800],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
