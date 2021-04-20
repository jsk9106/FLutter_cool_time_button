import 'package:flutter/material.dart';
import 'dart:math';

class ProgressAnimateContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final double? progress;

  ProgressAnimateContainer(
      {this.width, this.height, this.child, this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: progress == 0
          ? child
          : CustomPaint(
              foregroundPainter: ProgressAnimatePainter(progress!),
              child: child,
            ),
    );
  }
}

class ProgressAnimatePainter extends CustomPainter {
  double progress;

  ProgressAnimatePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black.withOpacity(0.4);
    paint.style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height / 2);
    double arcAngle = 2 * pi * (1 - progress);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 100),
      -pi / 2,
      arcAngle * -1,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant ProgressAnimatePainter oldDelegate) {
    return this.progress != oldDelegate.progress;
  }
}
