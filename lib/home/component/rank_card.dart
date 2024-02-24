import 'package:flutter/material.dart';
import 'package:gdsc/commmon/const/colors.dart';

class RankCard extends StatelessWidget {
  final String nickname; // 사용자 닉네임
  final dynamic distance; // 사용자 점수
  final Widget? child;

  const RankCard({
    required this.nickname,
    required this.distance,
    this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: 330,
      height: 60, // 높이를 조금 더 늘려서 정보를 표시할 수 있는 공간을 확보
      decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: Color(0xff91B194),
              offset: Offset(0, 2),
              blurRadius: 7,
            )
          ],
          color: W_BOX_COLOR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nickname, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('$distance 점', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
