import 'package:flutter/material.dart' hide TabBar;
import '../../common/fitness_colors.dart';
import 'tab_bar_view_model.dart';

class TabBar extends StatelessWidget {
  final TabBarViewModel viewModel;

  const TabBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: List.generate(viewModel.tabs.length, (index) {
          final isSelected = viewModel.selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => viewModel.onTabTapped(index),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? FitnessColors.primaryAction : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  viewModel.tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.black : FitnessColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}