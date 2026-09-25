import 'dart:async'; // Biblioteca necessária para controlar o tempo
import 'package:flutter/material.dart';
import '../common/fitness_colors.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/action_button/action_button_view_model.dart';
import '../models/exercise.dart';

class ActiveWorkoutScreen extends StatefulWidget {
  final Exercise exercise;

  const ActiveWorkoutScreen({super.key, required this.exercise});

  @override
  State<ActiveWorkoutScreen> createState() => _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends State<ActiveWorkoutScreen> {
  Timer? _restTimer;
  int _restSeconds = 0;
  final int _restDuration = 60; // 60 segundos de descanso padrão

  void _toggleSetCompletion(int index) {
    setState(() {
      final isNowCompleted = !widget.exercise.sets[index].isCompleted;
      widget.exercise.sets[index].isCompleted = isNowCompleted;

      // Se a série foi marcada como feita, avalia se inicia o cronômetro
      if (isNowCompleted) {
        final isExerciseFinished = widget.exercise.sets.every((s) => s.isCompleted);
        if (!isExerciseFinished) {
          _startRestTimer(); // Inicia descanso se ainda há séries
        } else {
          _stopRestTimer(); // Para o cronômetro se o exercício todo acabou
        }
      }
    });
  }

  void _startRestTimer() {
    _stopRestTimer(); // Cancela o cronômetro anterior para não duplicar
    setState(() {
      _restSeconds = _restDuration;
    });

    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_restSeconds > 0) {
        setState(() {
          _restSeconds--;
        });
      } else {
        _stopRestTimer();
      }
    });
  }

  void _stopRestTimer() {
    _restTimer?.cancel();
    setState(() {
      _restSeconds = 0; // Esconde o painel de descanso
    });
  }

  // Previne vazamento de memória quando o usuário sai da tela
  @override
  void dispose() {
    _restTimer?.cancel();
    super.dispose();
  }

  // Converte os segundos brutos para o formato visual "01:00"
  String get _formattedTime {
    int minutes = _restSeconds ~/ 60;
    int seconds = _restSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final isExerciseFinished = widget.exercise.sets.every((s) => s.isCompleted);

    return Scaffold(
      backgroundColor: FitnessColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: FitnessColors.textLight,
        title: Text(widget.exercise.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Músculo Alvo: ${widget.exercise.targetMuscle}",
              style: TextStyle(color: FitnessColors.textLight.withOpacity(0.6), fontSize: 16),
            ),
            const SizedBox(height: 32),

            // Cabeçalho da Tabela
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeaderLabel("SÉRIE"),
                _buildHeaderLabel("KG"),
                _buildHeaderLabel("REPS"),
                _buildHeaderLabel("FEITO"),
              ],
            ),
            const SizedBox(height: 16),

            // Lista de Séries (Sets)
            Expanded(
              child: ListView.builder(
                itemCount: widget.exercise.sets.length,
                itemBuilder: (context, index) {
                  final currentSet = widget.exercise.sets[index];
                  final isDone = currentSet.isCompleted;

                  return GestureDetector(
                    onTap: () => _toggleSetCompletion(index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isDone ? FitnessColors.primaryAction.withOpacity(0.1) : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDone ? FitnessColors.primaryAction : Colors.transparent,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildRowText("${currentSet.setNumber}", isDone),
                          _buildRowText("${currentSet.weight}", isDone),
                          _buildRowText("${currentSet.reps}", isDone),
                          Icon(
                            isDone ? Icons.check_circle : Icons.circle_outlined,
                            color: isDone ? FitnessColors.primaryAction : Colors.white38,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Painel do Cronômetro (Só aparece se o tempo for maior que 0)
            if (_restSeconds > 0)
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: FitnessColors.background,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: FitnessColors.primaryAction.withOpacity(0.5), width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer, color: FitnessColors.primaryAction),
                        const SizedBox(width: 12),
                        Text(
                          "Descanso Ativo",
                          style: TextStyle(color: FitnessColors.textLight.withOpacity(0.9), fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      _formattedTime,
                      style: const TextStyle(
                        color: FitnessColors.primaryAction,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

            // Botão Principal do Design System
            ActionButtonFactory.instantiate(
              ActionButtonViewModel(
                title: isExerciseFinished ? "Finalizar Exercício" : "Treino em Andamento...",
                isEnabled: isExerciseFinished,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderLabel(String text) {
    return SizedBox(
      width: 60,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: FitnessColors.textLight.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildRowText(String text, bool isDone) {
    return SizedBox(
      width: 60,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isDone ? FitnessColors.primaryAction : FitnessColors.textLight,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}