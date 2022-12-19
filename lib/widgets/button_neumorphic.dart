import 'package:flutter/material.dart';

class ButtonNeumorphic extends StatelessWidget {
  final VoidCallback onTap;
  final Color bgColor, topShadowColor, bottomShadowColor;
  final Icon icon;
  final double size;

  ButtonNeumorphic(
      {required this.onTap,
      this.size: 40,
      required this.icon,
      required this.topShadowColor,
      required this.bottomShadowColor,
      required this.bgColor})
      : assert(icon != null),
        assert(bgColor != null),
        assert(topShadowColor != null),
        assert(bottomShadowColor != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: bottomShadowColor,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
              BoxShadow(
                color: topShadowColor,
                blurRadius: 5,
                offset: Offset(-2, -2),
              )
            ]),
        child: icon,
      ),
    );
  }
}
