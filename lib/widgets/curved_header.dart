import 'package:flutter/material.dart';
import 'kin_logo.dart';

class CurvedHeader extends StatelessWidget {
  final double height;
  final String imagePath;

  const CurvedHeader({
    super.key, 
    required this.height,
    this.imagePath = 'assets/images/join-page-header.png',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipPath(
        clipper: BottomCurveClipper(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Container(
            // RN doesn't seem to have an overlay, removing it or making it very subtle if needed
            // color: Colors.black.withOpacity(0.1), 
          ),
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double curveDepth = 40.0;
    var path = Path();
    // Start from top-left
    path.lineTo(0, size.height - curveDepth);
    
    // Quadratic Bezier from (0, h-40) to (w, h-40) with control point at (w/2, h+40)
    // This makes the curve touch 'h' at the center.
    var controlPoint = Offset(size.width / 2, size.height + curveDepth);
    var endPoint = Offset(size.width, size.height - curveDepth);
    
    path.quadraticBezierTo(
      controlPoint.dx, controlPoint.dy,
      endPoint.dx, endPoint.dy
    );
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
