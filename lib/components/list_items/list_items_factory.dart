import 'package:flutter/material.dart';
import 'list_items.dart';
import 'list_items_view_model.dart';

class ListItemFactory {
  static Widget instantiate(ListItemViewModel viewModel) {
    return ListItemWidget(viewModel: viewModel);
  }
}