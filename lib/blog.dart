import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*중요 파일*/
Widget blog(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back), color: Color(0xFF000000), // 앱바 아이콘 색상
        onPressed: () {
          Navigator.pop(context); // 뒤로 가기 버튼 동작
        },
      ),
      title: Text(
        '블로그',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color(0xFF000000),
        ),
      ),
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFB9FFCF), // 첫 번째 색상
            Color(0xFFE2BCF8), // 두 번째 색상
          ],
        ),
      ),
      child: Center(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Center(
                child: Container(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF49009D),
                    height: 1.4, // 줄 간격 조정
                    fontFamily: 'script'
                  ),
                  children: [
                    TextSpan(
                      text: '\n\n\n\n\t 이진혁 : ',
                    ),
                    TextSpan(
                      text: 'https://velog.io/@jh4016',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse('https://velog.io/@jh4016'));
                        },
                    ),
                    TextSpan(
                      text: '\n\n\t 신민지 : ',
                    ),
                    TextSpan(
                      text: 'https://velog.io/@minjii',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse('https://velog.io/@minjii'));
                        },
                    ),
                    TextSpan(
                      text: '\n\n\t 양화진 : ',
                    ),
                    TextSpan(
                      text: 'https://ghkwls.tistory.com',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse('https://ghkwls.tistory.com'));
                        },
                    ),
                    TextSpan(
                      text: '\n\n\t 이수진 : ',
                    ),
                    TextSpan(
                      text: 'https://velog.io/@soojn',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse('https://velog.io/@soojn'));
                        },
                    ),
                    TextSpan(
                      text: '\n\n\t 윤승재 : ',
                    ),
                    TextSpan(
                      text: 'https://velog.io/@0poison',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse('https://velog.io/@0poison'));
                        },
                    )
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    ),
  );
}
