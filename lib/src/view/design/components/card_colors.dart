import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';
import 'row_color.dart';

class CardColors extends StatelessWidget {
  const CardColors({super.key});

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
                  'Colors',
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
            const RowColor(colors: [
              {"name": "Primary", "color": MyColors.primary},
              {"name": "Secondary", "color": MyColors.secondary}
            ]),
            const SizedBox(
              height: 16,
            ),
            const RowColor(colors: [
              {"name": "Info", "color": MyColors.info},
              {"name": "Success", "color": MyColors.success},
              {"name": "Warning", "color": MyColors.warning},
              {"name": "Error", "color": MyColors.error}
            ]),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
