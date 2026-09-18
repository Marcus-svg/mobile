import 'package:flutter/material.dart' hide TabBar;
import 'tab_bar.dart';
import 'tab_bar_view_model.dart';

class TabBarFactory {
  static Widget instantiate(TabBarViewModel viewModel) {
    return TabBar(viewModel: viewModel);
  }
}