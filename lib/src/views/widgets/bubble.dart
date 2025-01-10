import 'package:blog_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class BubbleContainer extends StatelessWidget {
  final double size;
  const BubbleContainer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
