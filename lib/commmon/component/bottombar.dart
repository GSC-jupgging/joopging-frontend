import 'package:flutter/material.dart';

import '../const/colors.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const BottomBar({
    this.currentIndex = 0,
    this.onTap,
    Key ? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: BODY_TEXT_COLOR,
      unselectedItemColor: Colors.black,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.shifting,
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: '나의 기록'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정'
        ),

      ],
    );
  }
}
