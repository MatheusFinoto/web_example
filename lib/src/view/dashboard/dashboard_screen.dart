import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../components/shared/header.dart';
import '../../components/shared/sidebar.dart';
import '../../stores/base_store.dart';
import '../../utils/constants.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final BaseStore baseStore = GetIt.I<BaseStore>();
  late final GoRouter? router;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
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
                    // controller: baseStore.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const Header(),
                            SizedBox(height: appBarHeight),
                            //! ROW PATH INFO
                            Row(children: [
                              Expanded(
                                child: Text(
                                  'Dashboard',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                            formatRouter(
                                path: router.location,
                                onTap: (e) {
                                  context.go('/$e');
                                }),

                            SizedBox(height: appBarHeight),
                          ],
                        ),
                      )
                    ],
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
