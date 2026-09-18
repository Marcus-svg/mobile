import 'package:flutter/material.dart';

class ListItemViewModel {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final VoidCallback onTap;

  const ListItemViewModel({
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.onTap,
  });
}