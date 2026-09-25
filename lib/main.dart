import 'package:flutter/material.dart';
import 'common/fitness_colors.dart';
import 'screens/sample_tab_bar_screen.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T.car Fitness', // Nome provisório do app
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: FitnessColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: FitnessColors.primaryAction,
          brightness: Brightness.dark,
        ),
      ),
      home: const SampleTabBarScreen(),
    );
  }
}