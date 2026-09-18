import 'package:flutter/material.dart';

class TabBarViewModel {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabTapped;

  const TabBarViewModel({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabTapped,
  });
}