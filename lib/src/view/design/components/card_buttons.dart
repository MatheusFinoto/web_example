import 'package:flutter/material.dart';
import 'package:web_example/src/components/shared/components.dart';
import 'package:web_example/src/view/design/components/row_button.dart';

import '../../../utils/my_colors.dart';
import 'row_color.dart';

class CardButtons extends StatelessWidget {
  const CardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Buttons',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const RowButton(type: 'Elevated', buttons: [
              {"name": "Primary", "color": MyColors.primary},
              {"name": "Info", "color": MyColors.info},
              {"name": "Success", "color": MyColors.success},
              {"name": "Warning", "color": MyColors.warning},
              {"name": "Error", "color": MyColors.error},
            ]),
            const SizedBox(
              height: 16,
            ),
            const RowButton(type: 'Outlined', buttons: [
              {"name": "Primary", "color": MyColors.primary},
              {"name": "Info", "color": MyColors.info},
              {"name": "Success", "color": MyColors.success},
              {"name": "Warning", "color": MyColors.warning},
              {"name": "Error", "color": MyColors.error},
            ]),
          ],
        ),
      ),
    );
  }
}
