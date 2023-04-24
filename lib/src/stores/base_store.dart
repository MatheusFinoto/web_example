// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:web_example/src/utils/constants.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  _BaseStore() {
    // instanceSettings();
  }

  @observable
  int selectedPage = 0;

  @action
  void setSelectedPage(int page) => selectedPage = page;

  @observable
  bool expand = false;

  @action
  void setExpand(v) => expand = v;

  @observable
  bool showContent = false;

  @action
  void setShowContent(v) => showContent = v;

  @observable
  PageController? pageController;

  @observable
  bool themeDark = true;

  @action
  void setTheme(value) => themeDark = value;

  @action
  Map<String, String> getHeader() {
    Map<String, String> header = {};
    // if (userModel == null) {
    //   header = {
    //     "Content-Type": "application/json",
    //   };
    // } else {
    //   header = {
    //     "Content-Type": "application/json",
    //     "Authorization": "Bearer ${userModel!.data!.token!}",
    //   };
    // }
    return header;
  }

  @observable
  String? currentRoute;

  @action
  void setCurrentRoute(v) => currentRoute = v;

  @action
  Future<void> instanceSettings() async {
    var obsSettings = await Hive.box('settings').get('themeDark').watch();

    obsSettings.listen((event) {
      nPrint(event.value);
    });
  }
}
