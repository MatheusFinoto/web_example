import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../components/shared/sidebar.dart';
import '../../stores/base_store.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
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
