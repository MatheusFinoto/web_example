import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../stores/base_store.dart';
import '../../utils/constants.dart';
import '../../utils/my_colors.dart';
import 'components.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final BaseStore baseStore = GetIt.I<BaseStore>();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1360),
      child: SizedBox(
        height: appBarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(),
              ),
              CustomIconButton(
                  onTap: () {}, iconData: Icons.notifications_outlined),
              const SizedBox(
                width: 8,
              ),
              const CircleAvatar()
            ],
          ),
        ),
      ),
    );
  }
}
