import 'package:flutter/material.dart';

class BadgeItem extends StatelessWidget {
  const BadgeItem({
    super.key,
    required this.child,
    required this.value,
    this.color,
  });

  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: (color != null) ? color : Colors.amber,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
