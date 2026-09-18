import 'package:flutter/material.dart';
import '../common/fitness_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: FitnessColors.primaryAction,
              strokeWidth: 6,
            ),
            const SizedBox(height: 32),
            Text(
              "Treinando a IA...",
              style: TextStyle(
                color: FitnessColors.textLight.withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}