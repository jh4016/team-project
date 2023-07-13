import 'package:teamproject/promise.dart';
import 'package:flutter/material.dart';

import 'blog.dart';
import 'goal.dart';
import 'teamIntroduction.dart';

/*중요 파일*/
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        "name": "팀원소개",
        "imgUrl":
            "https://t1.daumcdn.net/thumb/R720x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/JIE/image/Jq4if78e5S6_00BHfwSYoxdchlI.jpg",
      },
      {
        "name": "목표",
        "imgUrl":
            "https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=13221732&filePath=L2Rpc2sxL25ld2RhdGEvMjAxOS8yMS9DTFMxMDAwNC8xMzIyMTczMl9XUlRfMjAxOTExMjFfMQ==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10004",
      },
      {
        "name": "약속",
        "imgUrl":
            "https://img.freepik.com/premium-photo/man-and-woman-do-pinky-promise-or-pinky-swear-hands-sign-on-white-background_335640-4072.jpg",
      },
      {
        "name": "블로그",
        "imgUrl":
            "https://blog.kakaocdn.net/dn/XVMFX/btqyseZTBHR/0AeJnTycMLrOn2udXIYcSk/img.png",
      },
    ];
    return Scaffold(
        appBar:AppBar(
          title: Text(
            '중꺾마',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'BMDOHYEON', // 여기에 사용할 폰트 패밀리를 입력하세요
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            String name = dataList[index]['name'];
            String imgUrl = dataList[index]['imgUrl'];

            Widget pageWidget;

            // index 값에 따라 다른 페이지 클래스를 선택합니다.
            if (index == 0) {
              pageWidget = TeamIntroductionPage();
            } else if (index == 1) {
              pageWidget = GoalPage();
            } else if (index == 2) {
              pageWidget = PromisePage();
            } else if (index == 3) {
              pageWidget = BlogPage();
            } else {
              // index에 해당하는 페이지가 없는 경우 처리할 내용을 추가합니다.
              // 예를 들어, 에러 페이지를 표시하거나 기본 페이지로 이동할 수 있습니다.
              pageWidget = Container();
            }

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 250),
                    // 전환 시간 설정
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        pageWidget,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Card(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      imgUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Color(0xFF000000).withOpacity(0.5),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
