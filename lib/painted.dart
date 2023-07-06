import 'package:flutter/material.dart';

import 'constant.dart';


class Painted1 extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {

    final Paint paint=Paint();
    final Path path = Path();
    path.moveTo(0,size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.45,size.height * 0.25,
        size.width * 0.5, size.height * 0.5);

    path.quadraticBezierTo(size.width * 0.58,size.height * 0.78,
        size.width * 0.1, size.height * 0.9);

    path.lineTo(0.0, size.height * 0.92);


    path.close();

    paint.color = Constant.white.withOpacity(0.5);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class Painted2 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final Paint paint=Paint();
    final Path path = Path();
    path.moveTo(size.width,size.height * 0.1);

    path.quadraticBezierTo(size.width * 0.55,size.height * 0.2,
        size.width * 0.6, size.height * 0.4);

    path.quadraticBezierTo(size.width * 0.65,size.height * 0.5,
        size.width , size.height * 0.6);

    path.lineTo(size.width, size.height * 0.4);


    path.close();

    paint.color = Constant.white.withOpacity(0.5);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}