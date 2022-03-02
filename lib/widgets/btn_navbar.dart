import 'package:aplikasikos/theme.dart';
import 'package:flutter/material.dart';

class BtnNavbar extends StatelessWidget {
  final String imgUrl;
  final bool isActive;

  BtnNavbar({this.imgUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Spacer(),
        Image.asset(
          imgUrl,
          width: 26,
        ),
        Spacer(),
        isActive ?
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(1000)
            )
          ),
        ): Container(),
      ],
    );

  }
}
