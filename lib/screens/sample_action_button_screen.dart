import 'package:flutter/material.dart';
import '../common/fitness_colors.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/action_button/action_button_view_model.dart';

class SampleActionButtonScreen extends StatelessWidget {
  const SampleActionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColors.background,
      appBar: AppBar(title: const Text('Action Button Sample'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ActionButtonFactory.instantiate(
            ActionButtonViewModel(
              title: "Start Workout",
              onPressed: () => print("Treino iniciado!"),
            ),
          ),
        ),
      ),
    );
  }
}