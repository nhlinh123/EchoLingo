import 'package:flutter/material.dart';

class ReviewActionBar extends StatelessWidget {
  const ReviewActionBar({super.key, required this.onAction});

  final ValueChanged<String> onAction;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _ReviewActionButton(label: 'AGAIN', color: Colors.red, onTap: onAction),
        _ReviewActionButton(label: 'HARD', color: Colors.orange, onTap: onAction),
        _ReviewActionButton(label: 'GOOD', color: Colors.green, onTap: onAction),
        _ReviewActionButton(label: 'EASY', color: Colors.blue, onTap: onAction),
      ],
    );
  }
}

class _ReviewActionButton extends StatelessWidget {
  const _ReviewActionButton({required this.label, required this.color, required this.onTap});

  final String label;
  final Color color;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () => onTap(label),
      child: Text(label),
    );
  }
}
