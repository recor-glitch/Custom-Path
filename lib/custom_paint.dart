import 'package:flutter/cupertino.dart';

class CustomCurve extends CustomClipper<Path> {
  final BuildContext context;
  final double curve1_height, curve2_height;
  CustomCurve(
      {required this.context,
      required this.curve1_height,
      required this.curve2_height});
  // @override
  // void paint(Canvas canvas, Size size) {
  //   var _paint = Paint()
  //     ..color = Color.fromRGBO(0, 0, 0, 1)
  //     ..strokeCap = StrokeCap.round
  //     ..strokeWidth = 5
  //     ..style = PaintingStyle.fill;
  //   var path = Path();

  //   path.lineTo(0, size.height - size.height * 0.2);

  //   path.quadraticBezierTo(size.width / 6, size.height, size.width / 3,
  //       size.height - size.height / 5);
  //   path.quadraticBezierTo(size.width / 1.3, size.height - size.height * 0.8,
  //       size.width, size.height - size.height * 0.2);

  //   path.lineTo(size.width, 0);

  //   canvas.drawPath(path, _paint);
  // }

  // @override
  // bool shouldRepaint(covariant CustomPainter oldDelegate) {
  //   return true;
  // }

  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - size.height * 0.2);

    path.quadraticBezierTo(size.width / 4, size.height, size.width / 1.8,
        size.height - size.height / 5);
    path.quadraticBezierTo(size.width, size.height - size.height * 0.5,
        size.width, size.height - size.height * 0.2);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
