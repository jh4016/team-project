import 'package:flutter/material.dart';

import 'teamIntroduction.dart';

/*중요 파일*/
class TeamMemberDetailPage extends StatelessWidget {
  final TeamMember member;

  TeamMemberDetailPage({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('팀원 소개 상세'),
        titleTextStyle: TextStyle(
             color:  Color(0xFF000000), fontSize: 30, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData( color:  Color(0xFF000000)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE5F6FF), // 첫 번째 색상
              Color(0xFFF9EBFF), // 두 번째 색상
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "이름: ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    member.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'human',
                        color:  Color(0xFFA8D248)
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MBTI: ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    member.mbti,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'human',
                        color:  Color(0xFF2C1577)
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "[팀]과 [자신]에 대한 설명 및 MBTI: \n",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextSpan(
                      text: member.description,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "[객관적으로 살펴본 자신의 장점: \n",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextSpan(
                      text: member.merit,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "자신의 스타일 협업 스타일 소개: \n",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextSpan(
                      text: member.style,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
