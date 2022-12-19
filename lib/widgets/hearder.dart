// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Text appname;
  final Image logo;
  final Color bgColor;

  Header(
      {
      required this.appname,
      required this.logo,
      required this.bgColor})
      : assert(bgColor != null),
        assert(logo != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ appname,logo],
      ),
    );
  }
}
