import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../stores/base_store.dart';
import 'side_bar_tile.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final BaseStore baseStore = GetIt.I<BaseStore>();

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Observer(builder: (_) {
      return AnimatedContainer(
        margin: const EdgeInsets.all(0),
        duration: const Duration(milliseconds: 300),
        onEnd: () {
          if (baseStore.expand == true) {
            baseStore.setShowContent(true);
          }
        },
        width: baseStore.expand ? 250 : 80,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // baseStore.showContent
                //     ? SizedBox(
                //         width: 160,
                //         child: Image.asset(
                //           'assets/allthenticLogo.webp',
                //           width: 160,
                //           fit: BoxFit.fitWidth,
                //         ))
                //     : Container(),
                baseStore.showContent ? const SizedBox(width: 8) : Container(),
                IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      baseStore.setExpand(!baseStore.expand);
                      if (baseStore.expand == false) {
                        baseStore.setShowContent(false);
                      }
                    },
                    icon: baseStore.expand
                        ? const Icon(Icons.close)
                        : const Icon(Icons.menu)),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: ListView(
                children: [
                  SideBarTile(
                      title: baseStore.showContent ? 'DASHBOARD' : '',
                      selected: router.location == "/dashboard",
                      icon: Icons.dashboard_outlined,
                      onTap: () => context.go('/dashboard')),
                  const SizedBox(
                    height: 8,
                  ),
                  SideBarTile(
                      title: baseStore.showContent ? 'PROFILE' : '',
                      selected: router.location == "/profile",
                      icon: Icons.person_2_outlined,
                      onTap: () => context.go('/profile')),
                  const SizedBox(
                    height: 8,
                  ),
                  SideBarTile(
                      title: baseStore.showContent ? 'DESIGN' : '',
                      selected: router.location == "/design",
                      icon: Icons.color_lens_outlined,
                      onTap: () => context.go('/design')),
                ],
              ),
            ),
            // Container(
            //   decoration:
            //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //   margin: const EdgeInsets.only(right: 12, left: 12),
            //   child: ListTile(
            //     dense: false,
            //     title: Text(
            //       baseStore.showContent ? 'SAIR' : '',
            //       style: const TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black45),
            //     ),
            //     trailing: const Icon(Icons.exit_to_app_outlined),
            //     onTap: () {},
            //   ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch.adaptive(
                  value: baseStore.themeDark,
                  onChanged: baseStore.setTheme,
                )
              ],
            ),
            SideBarTile(
                title: baseStore.showContent ? 'SAIR' : '',
                selected: router.location == "/",
                icon: Icons.exit_to_app,
                onTap: () => context.go('/')),
          ],
        ),
      );
    });
  }
}
