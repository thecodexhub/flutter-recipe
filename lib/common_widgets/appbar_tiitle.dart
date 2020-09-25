import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Food ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Recipe',
          style: TextStyle(
            color: Colors.red[900],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
