import 'package:flutter/material.dart';
import 'package:web_example/src/components/shared/components.dart';
import 'package:web_example/src/view/design/components/row_button.dart';

import '../../../utils/my_colors.dart';

class CardTextFields extends StatelessWidget {
  const CardTextFields({super.key});

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
                  'TextFields',
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
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'Nome Completo',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'Telefone',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'Email',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'Pais',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'Estado',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'Cidade',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'Endereço',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomTextField(
                    onChanged: (v) {},
                    title: 'CEP',
                    errorText: null,
                    mandatory: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
