import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
    ));
  }
}
