import 'package:flutter/material.dart';
import 'dart:math';
import '../common/fitness_colors.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/action_button/action_button_view_model.dart';

class StickmanScreen extends StatefulWidget {
  const StickmanScreen({super.key});

  @override
  State<StickmanScreen> createState() => _StickmanScreenState();
}

class _StickmanScreenState extends State<StickmanScreen> {
  List<Offset?> _points = [];
  String _resultMessage = "Desenhe uma pessoa e toque em Analisar";

  void _analyzeDrawing() {
    if (_points.where((p) => p != null).length < 20) {
      setState(() {
        _resultMessage = "Isso não é uma pessoa (Falta tinta!)";
      });
      return;
    }

    // Simulação Heurística (Mock) de Inteligência Artificial
    final random = Random();
    final isPerson = random.nextBool();

    setState(() {
      if (isPerson) {
        _resultMessage = "✅ Identificado: É uma pessoa (Stickman)!";
      } else {
        _resultMessage = "❌ Isso definitivamente não é uma pessoa.";
      }
    });
  }

  void _clearCanvas() {
    setState(() {
      _points.clear();
      _resultMessage = "Desenhe uma pessoa e toque em Analisar";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColors.background,
      appBar: AppBar(
        title: const Text('IA: Reconhecer Stickman'),
        backgroundColor: Colors.transparent,
        foregroundColor: FitnessColors.textLight,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _clearCanvas,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _resultMessage,
              style: TextStyle(
                color: _resultMessage.contains('✅') ? FitnessColors.primaryAction : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: FitnessColors.primaryAction.withOpacity(0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      RenderBox renderBox = context.findRenderObject() as RenderBox;
                      _points.add(renderBox.globalToLocal(details.globalPosition));
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      _points.add(null); // Cria a quebra do traço ao levantar o dedo
                    });
                  },
                  child: CustomPaint(
                    painter: DrawingPainter(_points),
                    size: Size.infinite,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ActionButtonFactory.instantiate(
              ActionButtonViewModel(
                title: "Analisar Desenho",
                onPressed: _analyzeDrawing,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = FitnessColors.primaryAction
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}