import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final Size? size;
  const Btn({
    super.key,
    required this.label,
    required this.onPressed,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: size ??
            Size(
              MediaQuery.sizeOf(context).width,
              40,
            ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
