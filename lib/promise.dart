import 'package:flutter/material.dart';

/*중요 파일*/
Widget promise(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),  color:  Color(0xFF000000), // 앱바 아이콘 색상
        onPressed: () {
          Navigator.pop(context); // 뒤로 가기 버튼 동작
        },
      ),
      title: Text(
        '약속',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
           color:  Color(0xFF000000),
          fontFamily: '조선궁서체',
        ),
      ),
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFA06F4A), // 첫 번째 색상
            Color(0xFFFFD6BB), // 두 번째 색상
          ],
        ),
      ),
      child: Center(
        child: Text(
          '\t 1. 푸쉬할 때 알려줘라 \n\n'
          '\t 2. 사유 없이 지각 하지 마라 \n\n'
          '\t 3. 소음 줄여라 \n\n'
          '\t 4. 검색하고 물어봐라 \n\n'
          '\t 5. 밥 먹을 때 조용히\n\n'
          '\t 6. 말 없이 자리 비우지 마라',
          style: TextStyle(
            fontSize: 30,
             color:  Color(0xFF002B4F), fontFamily: '조선궁서체'
          ),
        ),
      ),
    ),
  );
}
