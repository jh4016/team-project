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
        title: Text('탐원 소개 상세'),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "이름: ${member.name}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "MBTi: ${member.mbti}",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
