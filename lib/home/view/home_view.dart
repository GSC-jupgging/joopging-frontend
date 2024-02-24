import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:gdsc/home/component/home_card.dart';
import 'package:gdsc/home/component/rank_card.dart';
import 'package:gdsc/map/map_recommend_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key ? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String nickname = "User";
  int userPoints = 0;
  List<Map<String, dynamic>> topUsers = []; // 상위 사용자 정보 리스트

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    fetchTopUsers(); // 상위 사용자 정보 가져오기
  }

  Future<void> fetchUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        setState(() {
          nickname = userDoc.get('nickname') ?? "User";
          userPoints = userDoc.get('points') ?? 0;
        });

      } catch (e) {
        print("Error fetching user nickname: $e");
      }
    }
  }

  Future<void> fetchTopUsers() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('points', descending: true) // 거리를 기준으로 내림차순 정렬
          .limit(5) // 상위 5명만 가져오기
          .get();

      List<Map<String, dynamic>> users = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        users.add({
          'nickname': data['nickname'] ?? 'Unknown', // 닉네임이 없는 경우 'Unknown' 사용
          'points': data['points'] ?? 0, // 점수 정보가 없는 경우 0으로 처리
        });
      }

      setState(() {
        topUsers = users; // 가져온 사용자 정보로 업데이트
      });
    } catch (e) {
      print("Error fetching top users: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: BG_COLOR,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 90),
            Home_Card(
              height: 90,
              color: W_BOX_COLOR,
              child: Text("안녕하세요 ${nickname}님,\n플러깅하기 좋은 날입니다.",
                style: TextStyle(color:BODY_TEXT_COLOR,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,),
            ),

            SizedBox(height: 20),

            Home_Card(
              height: 115,
              onTap: (){},
              color: BOX_COLOR,
              child: Column(
                children: [
                  Flexible(
                    flex: 8,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("${nickname}\nLv.2",
                              style: TextStyle(
                                  color: W_BOX_COLOR,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: W_BOX_COLOR, width: 3),
                                    right: BorderSide(color: W_BOX_COLOR ,width: 3)
                                )
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text("플러깅 하러가기",
                              style: TextStyle(
                                  color: W_BOX_COLOR,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("${userPoints}\npoint",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(child: Container(
                    color: Colors.white,
                  ), flex: 2,)
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: 330,
              height: 40,
              child: Text("주간랭킹",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            // 상위 사용자 정보를 RankCard로 표시
            for (var user in topUsers)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: RankCard(
                  nickname: user['nickname'],
                  distance: user['points'],
                ),
              ),

//            RankCard(),
//            SizedBox(height: 8),
//            RankCard(),
//            SizedBox(height: 8),
//            RankCard(),
 //           SizedBox(height: 8),
//            RankCard(),
//            SizedBox(height: 8),
//            RankCard(),
//            SizedBox(height: 8),

            SizedBox(height: 20),

            Home_Card(
              height: 90,
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => MapRecommendView()));

              },
              Decoimage: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "asset/map/mapex.png"
                  )),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    child: Center(
                      child: Text("산책로 찾기",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
