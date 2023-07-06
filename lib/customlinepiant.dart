
import 'package:flutter/cupertino.dart';
import 'package:remainderapp/constant.dart';

class CustomLinePaint extends CustomPainter{
  double? width;
  double? height;

  CustomLinePaint({this.width, this.height});
  @override
  void paint(Canvas canvas, Size size) {
    final startPoint = Offset(width! * 0.99, height!);
    final endPoint = Offset(width! * 0.01, height!);

    final paint = Paint()
      ..color=Constant.white
      .. strokeWidth = 10;
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}