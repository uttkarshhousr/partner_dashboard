import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadingLineSeperator extends StatelessWidget {
  const FadingLineSeperator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.5), // Start color
            Colors.grey.withOpacity(0.0), // End color
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
