import 'package:flutter/material.dart';
import 'package:gdsc/commmon/const/colors.dart';

class ProfileList extends StatelessWidget {
  final Widget ? child;


  const ProfileList({
    this.child,
    Key ? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 330,
      height: 50,
      decoration: ShapeDecoration(
          shadows: [BoxShadow(
            color: Color(0xff91B194),
            offset: Offset(0,2),
            blurRadius:7,
          )],
          color: W_BOX_COLOR,
          shape: Border(
            bottom: BorderSide(
              color: BODY_TEXT_COLOR
            )
          )

      ),
      child: child,
    );
  }
}
