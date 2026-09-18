import 'package:flutter/material.dart';

class ActionButtonViewModel {
  final String title;
  final VoidCallback onPressed;
  final bool isEnabled;

  const ActionButtonViewModel({
    required this.title,
    required this.onPressed,
    this.isEnabled = true,
  });
}