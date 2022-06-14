/*
 * This computer program, as defined in the Copyright, Designs and Patents Act 1998 and the Software Directive (2009/24/EC), is the copyright of Logic Valley Ltd, a wholly owned subsidiary of Marston (Holdings) Ltd. All rights are reserved.
 */

import 'package:flutter/material.dart';

class MenuProfileContent extends StatefulWidget {
  final String avator;
  final String customerName;
  final String mobileNo;

  const MenuProfileContent(this.avator, this.customerName, this.mobileNo,
      {Key? key})
      : super(key: key);

  @override
  _MenuProfileContentState createState() => _MenuProfileContentState();
}

class _MenuProfileContentState extends State<MenuProfileContent> {
  _MenuProfileContentState();

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  // backgroundColor: hexToColor("#7A7A7A"),
                  child: Text(widget.avator,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: "Montserrat-Medium",
                          fontWeight: FontWeight.bold))),
              title: Text(widget.customerName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontFamily: "Montserrat-Medium",
                      fontWeight: FontWeight.bold)),
              subtitle: Text(widget.mobileNo,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontFamily: "Montserrat-Medium")),
            ),
            Container(
                height: 0.8,
                color: Colors.red,
                margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
          ],
        ));
  }
}
