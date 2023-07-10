import 'package:flutter/material.dart';

/*중요 파일*/
Widget goal(BuildContext context) {
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
        '목표',
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
              '\t 1. 성실하게 공부하자 \n\n'
              '\t 2. 잘해서 취업하자 \n\n'
              '\t 3. 알잘딱깔센 \n\n'
              '\t 4. 중요한 건 꺾였는데도 하는 마음 \n\n',
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
