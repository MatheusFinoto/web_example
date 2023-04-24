import 'package:flutter/material.dart';
import 'common_card.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({Key? key, this.texto}) : super(key: key);
  final String? texto;
  @override
  Widget build(BuildContext context) {
    return CommonCard(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          texto ?? 'Aguarde...',
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
