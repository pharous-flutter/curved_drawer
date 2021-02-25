import 'package:flutter/cupertino.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double widgetSize = 40;
    double clipped = 15;

    Path path = Path();
    path.lineTo(0, 0);

    path.lineTo(size.width, 0);

    /// Point 0
    path.lineTo(size.width, 70);

    /// Point 1
    double p1x = size.width;
    double p1y = 70 + clipped;

    /// Point 2
    double p2x = size.width - clipped;
    double p2y = 70 + (clipped * 2);

    /// Draw Bezier P0   P1  P2
    path.quadraticBezierTo(p1x, p1y, p2x, p2y);

    ///  Point 3
    double p3x = p2x - (widgetSize - clipped);
    double p3y = p2y + widgetSize / 2;

    /// Point 4
    double p4x = p2x;
    double p4y = p2y + widgetSize;

    /// Draw Bezier P2   P3  P4
    path.quadraticBezierTo(p3x, p3y, p4x, p4y);
    /// Point 5
    double p5x = p1x;
    double p5y = p4y + clipped;
    /// Point 6
    double p6x = size.width;
    double p6y = p5y+clipped;

    /// Draw Bezier P4  P5  P6
    path.quadraticBezierTo(p5x, p5y, p6x, p6y);

    // path.quadraticBezierTo(size.width-(widgetSize), 80+(widgetSize/2), size.width, 80+widgetSize);

    // path.quadraticBezierTo(30, size.height / 2, 10, size.height - 30);
    // path.quadraticBezierTo(0, size.height - 15, 0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
