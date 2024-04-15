import 'package:flutter/material.dart';

class NavigationIcon extends StatelessWidget {
  final Icon widgetIcon;
  final double size;
  final String text;
  final Function function;
  final Color widgetColour;

  const NavigationIcon({
    super.key,
    required this.widgetIcon,
    required this.size,
    required this.text,
    required this.function,
    required this.widgetColour
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => function,
      icon: Container(
        child: widgetIcon,
      ),
      color: widgetColour,
    );
  }
}
