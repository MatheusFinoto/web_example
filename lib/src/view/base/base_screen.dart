import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../stores/base_store.dart';
import '../dashboard/dashboard_screen.dart';
import '../profile/profile_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final BaseStore baseStore = GetIt.I<BaseStore>();

  @override
  void initState() {
    super.initState();
    baseStore.pageController =
        PageController(initialPage: baseStore.selectedPage);
    reaction((_) => baseStore.selectedPage,
        (int page) => baseStore.pageController!.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return PageView(
          controller: baseStore.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            DashBoardScreen(),
            ProfileScreen(),
          ],
        );
      }),
    );
  }
}
