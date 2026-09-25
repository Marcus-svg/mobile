import 'package:flutter/material.dart';
import '../common/fitness_colors.dart';
import '../components/tab_bar/tab_bar_factory.dart';
import '../components/tab_bar/tab_bar_view_model.dart';
import '../components/list_items/list_items_factory.dart';
import '../components/list_items/list_items_view_model.dart';
import '../models/exercise.dart';
import 'active_workout_screen.dart';

class SampleTabBarScreen extends StatefulWidget {
  const SampleTabBarScreen({super.key});

  @override
  State<SampleTabBarScreen> createState() => _SampleTabBarScreenState();
}

class _SampleTabBarScreenState extends State<SampleTabBarScreen> {
  int _currentIndex = 0;

  Widget _buildTreinosTab() {
    // 1. Instanciando os objetos reais de treino (OOP)
    final supino = Exercise(
      name: "Supino Reto",
      targetMuscle: "Peito e Tríceps",
      sets: [
        WorkoutSet(setNumber: 1, reps: 12, weight: 20),
        WorkoutSet(setNumber: 2, reps: 10, weight: 25),
        WorkoutSet(setNumber: 3, reps: 8, weight: 30),
      ],
    );

    final agachamento = Exercise(
      name: "Agachamento Livre",
      targetMuscle: "Quadríceps e Glúteos",
      sets: [
        WorkoutSet(setNumber: 1, reps: 12, weight: 40),
        WorkoutSet(setNumber: 2, reps: 10, weight: 45),
        WorkoutSet(setNumber: 3, reps: 8, weight: 50),
      ],
    );

    // Lista consolidada de exercícios
    final exerciciosDoDia = [supino, agachamento];

    // 2. Convertendo a lista de objetos de dados para ViewModels visuais
    final List<ListItemViewModel> workoutExercises = exerciciosDoDia.map((ex) {
      return ListItemViewModel(
        title: ex.name,
        subtitle: "${ex.sets.length} séries totais",
        leadingIcon: Icons.fitness_center,
        onTap: () {
          // Navega para a tela ativa enviando os dados do exercício tocado
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ActiveWorkoutScreen(exercise: ex)),
          );
        },
      );
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 24.0),
      itemCount: workoutExercises.length,
      itemBuilder: (context, index) {
        return ListItemFactory.instantiate(workoutExercises[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColors.background,
      appBar: AppBar(
        title: const Text('Visão Geral'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: FitnessColors.textLight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Menu Superior
            TabBarFactory.instantiate(
              TabBarViewModel(
                tabs: const ['Treinos', 'Dieta', 'Perfil'],
                selectedIndex: _currentIndex,
                onTabTapped: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),

            // Área dinâmica que muda de acordo com a aba escolhida
            Expanded(
              child: _currentIndex == 0
                  ? _buildTreinosTab()
                  : Center(
                child: Text(
                  'Área de ${_currentIndex == 1 ? "Dieta" : "Perfil"} em desenvolvimento',
                  style: TextStyle(
                    color: FitnessColors.textLight.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}