// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:web_example/src/utils/my_colors.dart';

import '../../stores/base_store.dart';
import '../../utils/theme.dart';
import '../base/base_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final BaseStore baseStore = GetIt.I<BaseStore>();
  bool selected = false;
  double containerHei = 20;

  @override
  void initState() {
    super.initState();

    changeSize();
  }

  void changeSize() async {
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      setState(() {
        containerHei = 50;
      });
    });
  }

  Future<void> checkLoggedUser(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    context.go('/dashboard');
    // bool checkUser = await baseStore.loadUserModel();

    // if (checkUser) {
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const BaseScreen()));
    // } else {
    //   // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //   //     builder: (context) => const AuthenticationScreen()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.primary[500]!, MyColors.primary[900]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                height: containerHei,
                duration: const Duration(milliseconds: 600),
                curve: Curves.ease,
                onEnd: () {
                  checkLoggedUser(context);
                },
                child: Icon(Icons.fingerprint_outlined, size: containerHei),

                // child: Image.asset('assets/logo_new.png',
                //     height: 20, fit: BoxFit.cover)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
