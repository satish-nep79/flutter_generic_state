import 'package:flutter/material.dart';

class GenericStateScreens {
  final Widget loadingScreen;
  final Widget errorScreen;
  final Widget emptyScreen;

  GenericStateScreens({
    required this.loadingScreen,
    required this.errorScreen,
    required this.emptyScreen,
  });
}

class GenericStateConfig {
  static late GenericStateScreens screens;

  static void initialize(GenericStateScreens screens) {
    GenericStateConfig.screens = screens;
  }
}
