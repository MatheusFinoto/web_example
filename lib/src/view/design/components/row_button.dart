import 'package:flutter/material.dart';
import 'package:web_example/src/components/shared/components.dart';
import 'package:web_example/src/components/shared/custom_button_outlined.dart';

import '../../../utils/my_colors.dart';
import 'card_color_theme.dart';

class RowButton extends StatelessWidget {
  const RowButton({super.key, required this.type, required this.buttons});

  final String type;
  final List<Map<String, dynamic>> buttons;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  type,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w100),
                ))
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: buttons.map((e) {
                bool last = e == buttons[buttons.length - 1];
                return Row(
                  children: [
                    Builder(
                      builder: (_) {
                        switch (type) {
                          case 'Elevated':
                            return CustomButton(
                              onPressed: () {},
                              title: e['name'],
                              color: e['color'],
                            );
                          case 'Outlined':
                            return CustomButtonOutline(
                              onPressed: () {},
                              title: e['name'],
                              color: e['color'],
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                    last
                        ? Container()
                        : const SizedBox(
                            width: 8,
                          ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
