import 'package:flutter/material.dart';
import 'package:gdsc/commmon/component/layout/default_layout.dart';
import 'package:gdsc/commmon/const/colors.dart';
import 'package:gdsc/trophy/trophy_card.dart';
import '../controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyTrophy extends StatelessWidget {
  const MyTrophy({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String uid = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    final distance = data['distance'] ?? '0'; // 'distance' 값이 없을 경우 '0'으로 처리

    return
      DefaultLayout(
        backgroundColor: BG_COLOR,
          title: "나의 기록",
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ListView(
                children: [
                  SingleSection(
                    title: "전체 통계",
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Text('2024년 02월 14일부터',
                        style: TextStyle(
                          color: BODY_TEXT_COLOR,
                          fontSize: 16,),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text((distance ~/ 0.78).toString(),
                                style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 35,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3, 10, 3, 3),
                              child: Text('걸음',
                                style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 16,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('총 소모시간:',
                            style: TextStyle(
                              color: BODY_TEXT_COLOR,
                              fontSize: 20
                            ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text((distance / 4800 * 60).toStringAsFixed(3),
                                      style: TextStyle(
                                          color: BODY_TEXT_COLOR,
                                          fontSize: 20
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('분',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BODY_TEXT_COLOR
                                      ),),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: BG_COLOR))
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 뛴 거리:',
                              style: TextStyle(
                                color: BODY_TEXT_COLOR,
                                fontSize: 20
                              )),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('$distance', // Firestore에서 가져온 'distance' 값 사용
                                      style: TextStyle(
                                          color: BODY_TEXT_COLOR,
                                          fontSize: 20
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('M',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BODY_TEXT_COLOR
                                      ),),
                                  )
                                ],
                              )
                            ],
                          )

                      )
                    ],
                  ),
                  SingleSection(
                      title: '주간 통계',
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Text('2024년 02월 14일부터',
                          style: TextStyle(
                            color: BODY_TEXT_COLOR,
                            fontSize: 16,),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text((distance ~/ 0.78).toString(),
                                style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 35,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3, 10, 3, 3),
                              child: Text('걸음',
                                style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 16,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('총 소모시간:',
                              style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 20
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text((distance / 4800 * 60).toStringAsFixed(3),
                                      style: TextStyle(
                                          color: BODY_TEXT_COLOR,
                                          fontSize: 20
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('분',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BODY_TEXT_COLOR
                                      ),),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: BG_COLOR))
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 뛴 거리:',
                                  style: TextStyle(
                                      color: BODY_TEXT_COLOR,
                                      fontSize: 20
                                  )),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('$distance', // Firestore에서 가져온 'distance' 값 사용
                                      style: TextStyle(
                                          color: BODY_TEXT_COLOR,
                                          fontSize: 20
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('M',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BODY_TEXT_COLOR
                                      ),),
                                  )
                                ],
                              )
                            ],
                          )

                      )
                    ],
                  ),
                  SingleSection(
                    title: "월간 통계",
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Text('2024년 02월 14일부터',
                          style: TextStyle(
                            color: BODY_TEXT_COLOR,
                            fontSize: 16,),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text((distance ~/ 0.78).toString(),
                                style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 35,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3, 10, 3, 3),
                              child: Text('걸음',
                                style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 16,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: BG_COLOR))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('총 소모시간:',
                              style: TextStyle(
                                  color: BODY_TEXT_COLOR,
                                  fontSize: 20
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text((distance / 4800 * 60).toStringAsFixed(3),
                                      style: TextStyle(
                                          color: BODY_TEXT_COLOR,
                                          fontSize: 20
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('분',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BODY_TEXT_COLOR
                                      ),),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: BG_COLOR))
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 뛴 거리:',
                                  style: TextStyle(
                                      color: BODY_TEXT_COLOR,
                                      fontSize: 20
                                  )),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('$distance', // Firestore에서 가져온 'distance' 값 사용
                                      style: TextStyle(
                                          color: BODY_TEXT_COLOR,
                                          fontSize: 20
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('M',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BODY_TEXT_COLOR
                                      ),),
                                  )
                                ],
                              )
                            ],
                          )

                      ),
                      IconButton(
                        onPressed: (){
                          AuthController.instance.logout();
                        },
                        icon: Icon(Icons.login_outlined),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
      );

    } else if (snapshot.hasError) {
      // 데이터 로드에 실패했을 경우
      return Text("Error: ${snapshot.error}");
    } else {
      // 데이터가 로딩 중일 경우
      return const CircularProgressIndicator();
    }
    },
    );

  }
}



