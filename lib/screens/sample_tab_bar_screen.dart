import 'package:flutter/material.dart';
import '../common/fitness_colors.dart';
import '../components/tab_bar/tab_bar_factory.dart';
import '../components/tab_bar/tab_bar_view_model.dart';

class SampleTabBarScreen extends StatefulWidget {
  const SampleTabBarScreen({super.key});

  @override
  State<SampleTabBarScreen> createState() => _SampleTabBarScreenState();
}

class _SampleTabBarScreenState extends State<SampleTabBarScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColors.background,
      appBar: AppBar(title: const Text('Menu'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}