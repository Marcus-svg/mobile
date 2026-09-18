import 'package:flutter/material.dart';
import 'common/fitness_colors.dart';
import 'components/action_button/action_button_factory.dart';
import 'components/action_button/action_button_view_model.dart';

// Importe as suas novas telas aqui:
import 'screens/stickman_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/construction_screen.dart';

void main() {
  runApp(const StickmanApp());
}

class StickmanApp extends StatelessWidget {
  const StickmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stickman IA App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: FitnessColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: FitnessColors.primaryAction,
          brightness: Brightness.dark,
        ),
      ),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Interativo'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActionButtonFactory.instantiate(
              ActionButtonViewModel(
                title: '1. Desenhar Stickman',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const StickmanScreen())
                ),
              ),
            ),
            const SizedBox(height: 20),

            ActionButtonFactory.instantiate(
              ActionButtonViewModel(
                title: '2. Tela de Carregamento',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoadingScreen())
                ),
              ),
            ),
            const SizedBox(height: 20),

            ActionButtonFactory.instantiate(
              ActionButtonViewModel(
                title: '3. Área Secreta',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ConstructionScreen())
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}