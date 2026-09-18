import 'package:flutter/material.dart';
import '../common/fitness_colors.dart';
import '../components/list_items/list_items_factory.dart';
import '../components/list_items/list_items_view_model.dart';

class SampleListItemsScreen extends StatelessWidget {
  const SampleListItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ListItemViewModel> workoutExercises = [
      ListItemViewModel(
        title: "Supino Reto",
        subtitle: "4 séries x 10 repetições",
        leadingIcon: Icons.fitness_center,
        onTap: () => print("Abrindo detalhes..."),
      ),
    ];

    return Scaffold(
      backgroundColor: FitnessColors.background,
      appBar: AppBar(title: const Text('Treino do Dia'), backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: const EdgeInsets.all(24.0),
        itemCount: workoutExercises.length,
        itemBuilder: (context, index) {
          return ListItemFactory.instantiate(workoutExercises[index]);
        },
      ),
    );
  }
}