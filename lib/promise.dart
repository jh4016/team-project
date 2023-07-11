import 'package:flutter/material.dart';

/*중요 파일*/
Widget promise(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back), color: Colors.black, // 앱바 아이콘 색상
        onPressed: () {
          Navigator.pop(context); // 뒤로 가기 버튼 동작
        },
      ),
      title: Text(
        '약속',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    body: Container(
      child: Center(
        child: Text(
          '\t 1. 푸쉬할 때 알려주기 \n\n'
          '\t 2. 사유 없이 지각 하지 않기 \n\n'
          '\t 3. 생활할 때 소음처리방법? \n\n'
          '\t 4. 모르는 거 물어볼 때 :\n 검색하고 물어보기 \n\n'
          '\t 5. 점심시간 및 저녁 시간 :\n 마이크 꺼두기\n\n'
          '\t 6. 자리 잠시 비울 때 :\n 팀원에게 알려주기',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
      color: Colors.white,
    ),
  );
}
