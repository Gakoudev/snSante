import 'package:flutter/material.dart';

class HeaderSecond extends StatelessWidget {
  final Widget leadingBtn;
  final Text appname;
  final Image logo;
  final Color bgColor;

  HeaderSecond(
      {required this.leadingBtn,
      required this.appname,
      required this.logo,
      required this.bgColor})
      : assert(bgColor != null),
        assert(logo != null),
        assert(leadingBtn != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[leadingBtn,appname, logo],
      ),
    );
  }
}
