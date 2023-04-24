import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:web_example/src/view/design/components/card_buttons.dart';
import 'package:web_example/src/view/design/components/card_textfields.dart';

import '../../components/shared/header.dart';
import '../../components/shared/sidebar.dart';
import '../../stores/base_store.dart';
import '../../utils/constants.dart';
import 'components/card_colors.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({super.key});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  final BaseStore baseStore = GetIt.I<BaseStore>();

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
                    controller: baseStore.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Header(),
                              SizedBox(height: appBarHeight),
                              //! ROW PATH INFO
                              Row(children: [
                                Expanded(
                                  child: Text(
                                    'Design',
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

                              const SizedBox(height: 32),
                              const CardColors(),
                              const SizedBox(height: 32),
                              const CardButtons(),
                              const SizedBox(height: 32),
                              const CardTextFields(),
                              SizedBox(height: appBarHeight),
                            ],
                          ),
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
