import 'package:eproperty/values/values.dart';
import 'package:flutter/material.dart';

import 'custom_button_tear_drop.dart';

class DrawCircle extends CustomPainter {
  DrawCircle({
    @required this.radius,
    @required this.offset,
    @required this.color,
    this.elevation = CustomSizes.ELEVATION_8,
    this.transparentOccluder = true,
    this.shadowColor,
    this.hasShadow = false,
    this.shadowOffset = CustomSizes.SIZE_1,
  }) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  final double radius;
  final Offset offset;
  final Color color;
  final double elevation;
  final bool transparentOccluder;
  final bool hasShadow;
  final Color shadowColor;
  final double shadowOffset;
  Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    if (hasShadow) {
      final Path oval = Path()
        ..addOval(
            Rect.fromCircle(center: offset, radius: radius + shadowOffset));

      canvas.drawShadow(
        oval,
        shadowColor ?? Colors.black.withOpacity(0.7),
        elevation,
        transparentOccluder,
      );
    }

    canvas.drawCircle(offset, radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DrawTearDrop extends CustomPainter {
  DrawTearDrop({
    @required this.radius,
    @required this.offset,
    @required this.color,
    this.strokeWidth = 1.0,
    this.elevation = CustomSizes.ELEVATION_8,
    this.transparentOccluder = true,
    this.paintingStyle = PaintingStyle.fill,
    this.shadowColor,
    this.hasShadow = false,
    this.shadowOffset = CustomSizes.SIZE_1,
    this.tearDropAlignment = TearDropAlignment.topLeft,
  }) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;
  }

  final double radius;
  final double strokeWidth;
  final Offset offset;
  final Color color;
  final double elevation;
  final bool transparentOccluder;
  final bool hasShadow;
  final Color shadowColor;
  final double shadowOffset;
  final PaintingStyle paintingStyle;
  Paint _paint;
  final TearDropAlignment tearDropAlignment;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    if (hasShadow) {
//      Path oval = Path();

      if (tearDropAlignment == TearDropAlignment.topLeft) {
        canvas.drawPath(drawPathForTopLeftAlignment(size, path), _paint);
      } else if (tearDropAlignment == TearDropAlignment.topRight) {
        canvas.drawPath(drawPathForTopRightAlignment(size, path), _paint);
      } else if (tearDropAlignment == TearDropAlignment.bottomRight) {
        canvas.drawPath(drawPathForBottomRightAlignment(size, path), _paint);
      } else if (tearDropAlignment == TearDropAlignment.bottomLeft) {
        canvas.drawPath(drawPathForBottomLeftAlignment(size, path), _paint);
      }

      canvas.drawShadow(path, shadowColor ?? Colors.black.withOpacity(0.8),
          elevation, transparentOccluder);
    }

//    Path path = Path();

    if (tearDropAlignment == TearDropAlignment.topLeft) {
      canvas.drawPath(drawPathForTopLeftAlignment(size, path), _paint);
    } else if (tearDropAlignment == TearDropAlignment.topRight) {
      canvas.drawPath(drawPathForTopRightAlignment(size, path), _paint);
    } else if (tearDropAlignment == TearDropAlignment.bottomRight) {
      canvas.drawPath(drawPathForBottomRightAlignment(size, path), _paint);
    } else if (tearDropAlignment == TearDropAlignment.bottomLeft) {
      canvas.drawPath(drawPathForBottomLeftAlignment(size, path), _paint);
    }

    path.close();
  }

  Path drawPathForTopRightAlignment(Size size, Path path) {
    path.moveTo(size.width * 0.5, size.height * 0.0);
    path.lineTo(size.width, size.height * 0.0);
    path.lineTo(size.width, size.height * 0.5);

    final firstEndpoint = Offset(size.width * 0.5, size.height);
    final firstControlPoint = Offset(size.width * 0.95, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    final secondEndpoint = Offset(size.width * 0.0, size.height * 0.5);
    final secondControlPoint = Offset(size.width * 0.05, size.height);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    final thirdEndpoint = Offset(size.width * 0.5, size.height * 0.0);
    final thirdControlPoint = Offset(size.width * 0.0, size.height * 0.05);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);

    return path;
  }

  Path drawPathForTopLeftAlignment(Size size, Path path) {
    path.moveTo(size.width * 0.0, size.height * 0.5);
    path.lineTo(size.width * 0.0, size.height * 0.0);
    path.lineTo(size.width * 0.5, size.height * 0.0);

    final firstEndpoint = Offset(size.width, size.height * 0.5);
    final firstControlPoint = Offset(size.width, size.height * 0.05);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    final secondEndpoint = Offset(size.width * 0.5, size.height);
    final secondControlPoint = Offset(size.width * 0.95, size.height);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    final thirdEndpoint = Offset(size.width * 0.0, size.height * 0.5);
    final thirdControlPoint = Offset(size.width * 0.05, size.height);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);

    return path;
  }

  Path drawPathForBottomRightAlignment(Size size, Path path) {
    path.moveTo(size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.5, size.height);

    final firstEndpoint = Offset(size.width * 0.0, size.height * 0.5);
    final firstControlPoint = Offset(size.width * 0.0, size.height * 0.95);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    final secondEndpoint = Offset(size.width * 0.5, size.height * 0.0);
    final secondControlPoint = Offset(size.width * 0.05, size.height * 0.0);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    final thirdEndpoint = Offset(size.width, size.height * 0.5);
    final thirdControlPoint = Offset(size.width, size.height * 0.05);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);

    return path;
  }

  Path drawPathForBottomLeftAlignment(Size size, Path path) {
    path.moveTo(size.width * 0.0, size.height * 0.5);
    path.lineTo(size.width * 0.0, size.height);
    path.lineTo(size.width * 0.5, size.height);

    final firstEndpoint = Offset(size.width, size.height * 0.5);
    final firstControlPoint = Offset(size.width * 0.95, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    final secondEndpoint = Offset(size.width * 0.5, size.height * 0.0);
    final secondControlPoint = Offset(size.width * 0.95, size.height * 0.0);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    final thirdEndpoint = Offset(size.width * 0.0, size.height * 0.5);
    final thirdControlPoint = Offset(size.width * 0.05, size.height * 0.0);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);

    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
