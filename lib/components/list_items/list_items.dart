import 'package:flutter/material.dart';
import '../../common/fitness_colors.dart';
import 'list_items_view_model.dart';

class ListItemWidget extends StatelessWidget {
  final ListItemViewModel viewModel;

  const ListItemWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: FitnessColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: FitnessColors.primaryAction.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(viewModel.leadingIcon, color: FitnessColors.primaryAction),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.title,
                    style: const TextStyle(color: FitnessColors.textLight, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    viewModel.subtitle,
                    style: TextStyle(color: FitnessColors.textLight.withOpacity(0.7), fontSize: 14),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}