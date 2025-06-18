import 'package:flutter/material.dart';

class ScoreCircle extends StatelessWidget {
  final double score;
  final double total;
  final double size;  // diameter of circle
  final Color backgroundColor;
  final Color progressColor;
  final TextStyle? textStyle;

  const ScoreCircle({
    super.key,
    required this.score,
    required this.total,
    this.size = 200,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.green, // default fallback
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    double percent = (score / total).clamp(0.0, 1.0);

    // Use red if score is less than 70% of total
    Color dynamicProgressColor = percent < 0.7 ? Colors.red : progressColor;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: percent),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: size * 0.1, // proportional stroke
                backgroundColor: backgroundColor,
                valueColor: AlwaysStoppedAnimation<Color>(dynamicProgressColor),
              ),
            ),
            Container(
              width: size - size * 0.1,
              height: size - size * 0.1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFAE15CB),
              ),
              child: Center(
                child: Text(
                  "${score.toInt()} / ${total.toInt()}",
                  style: textStyle ??
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
