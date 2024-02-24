import 'package:flutter/material.dart';

class Home_Card extends StatelessWidget {
  final Widget ? child;
  final Color ? color;
  final GestureTapCallback? onTap;
  final DecorationImage? Decoimage;
  final Color? splashColor;
  final double ? height;

  const Home_Card({
    this.height,
    this.child,
    this.color,
    this.onTap,
    this.Decoimage,
    this.splashColor,

    Key ? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: splashColor,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Ink(
          width: 330,
          height: height,
          padding: EdgeInsets.all(10),
          decoration: ShapeDecoration(
              shadows: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0,3),
                blurRadius: 7,
              )],
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
            image: Decoimage,
            ),

            child: child
        ),
    );
  }
}
