import 'package:flutter/material.dart';

class KinLogo extends StatelessWidget {
  final double width;
  final double height;
  
  const KinLogo({
    super.key, 
    this.width = 74, 
    this.height = 50
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
