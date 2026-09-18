import 'package:flutter/material.dart';
import 'action_button.dart';
import 'action_button_view_model.dart';

class ActionButtonFactory {
  static Widget instantiate(ActionButtonViewModel viewModel) {
    return ActionButton(viewModel: viewModel);
  }
}