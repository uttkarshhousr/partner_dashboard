import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Ritu Sharma',
          style: Theme.of(context).textTheme.headline4, // Using headline4 from the text theme
        ),
        SizedBox(height: 8),
        Text(
          'Unlock your true productivity potential',
          style: Theme.of(context).textTheme.subtitle1, // Using subtitle1 from the text theme
        ),
      ],
    );
  }
}
