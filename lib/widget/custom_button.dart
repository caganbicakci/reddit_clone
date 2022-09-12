import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, required this.function, Key? key})
      : super(key: key);

  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: REDDIT_ORANGE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Text(
        'Click For Details',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
