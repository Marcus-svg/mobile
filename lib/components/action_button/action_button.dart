import 'package:flutter/material.dart';
import '../../common/fitness_colors.dart';
import 'action_button_view_model.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: viewModel.isEnabled ? viewModel.onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: FitnessColors.primaryAction,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          elevation: 0,
        ),
        child: Text(
          viewModel.title.toUpperCase(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}