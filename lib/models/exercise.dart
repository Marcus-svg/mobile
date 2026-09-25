class WorkoutSet {
  final int setNumber;
  final int reps;
  final double weight;
  bool isCompleted;

  WorkoutSet({
    required this.setNumber,
    required this.reps,
    required this.weight,
    this.isCompleted = false,
  });
}

class Exercise {
  final String name;
  final String targetMuscle;
  final List<WorkoutSet> sets;

  Exercise({
    required this.name,
    required this.targetMuscle,
    required this.sets,
  });
}