import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../components/shared/sidebar.dart';
import '../../stores/base_store.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final BaseStore baseStore = GetIt.I<BaseStore>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          const SideBar(),
          const VerticalDivider(thickness: 1),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: 1360, maxHeight: size.height),
                child: Observer(builder: (_) {
                  return PageView(
                    controller: baseStore.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
