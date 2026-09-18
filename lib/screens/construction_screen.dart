import 'package:flutter/material.dart';
import '../common/fitness_colors.dart';

class ConstructionScreen extends StatelessWidget {
  const ConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: FitnessColors.textLight,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.construction,
                size: 100,
                color: FitnessColors.primaryAction,
              ),
              const SizedBox(height: 24),
              const Text(
                "Opa! Área em Obras 🚧",
                style: TextStyle(
                  color: FitnessColors.textLight,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "O estagiário tropeçou no cabo do servidor e estamos reconstruindo esta secção. Volte mais tarde!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: FitnessColors.textLight.withOpacity(0.7),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}