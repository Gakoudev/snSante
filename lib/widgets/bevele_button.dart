import 'package:flutter/material.dart';
import 'package:snsante/styles/colors.dart';

class BeveledButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double width, height, iconSize;
  final BorderRadiusGeometry borderRadius;

  BeveledButton({
    required this.onTap,
    required this.icon,
    this.width: 45,
    this.height: 45,
    this.iconSize: 20,
    this.borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Material(
        shape: BeveledRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: ThemeColor.light, width: .5),
        ),
        child: Container(
          width: width,
          height: height,
          color: ThemeColor.darkBlue,
          child: Center(
            child: Icon(
              icon,
              color: ThemeColor.light,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}