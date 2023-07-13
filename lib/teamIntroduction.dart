import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teamproject/teammembers.dart';

import 'teamIntroductionDetail.dart';

class TeamIntroductionPage extends StatefulWidget {
  @override
  _TeamIntroductionPageState createState() => _TeamIntroductionPageState();
}

class _TeamIntroductionPageState extends State<TeamIntroductionPage> {
  void addTeamMember(TeamMember member) {
    setState(() {
      teamMembers.add(member);
    });
  }

  void deleteTeamMember(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Text('니 팀 버려?'),
          content: Text('정말로 이 팀원을 버립니까?'),
          actions: [
            TextButton(
              child: Text('버린다'),
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('방출 완료'),
                        content: Text('이 멤버는 우리 팀이 아닙니다!'),
                        actions: [
                          TextButton(
                            child: Text('닫기'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
                setState(() {
                  teamMembers.removeAt(index);
                });
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                      return AlertDialog(
                          title: Text('버리는 중'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          content: SizedBox(
                            height: 135,
                            child: Center(
                                child: SizedBox(
                                  child: new CircularProgressIndicator(
                                      valueColor: new AlwaysStoppedAnimation(
                                          Colors.blue),
                                      strokeWidth: 5.0),
                                  height: 50.0,
                                  width: 50.0,
                                )),
                          ));
                    });
              },
            ),
            TextButton(
              child: Text('용서한다'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void editTeamMember(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String name = teamMembers[index].name;
        String mbti = teamMembers[index].mbti;
        String description = teamMembers[index].description;
        String merit = teamMembers[index].merit;
        String style = teamMembers[index].style;
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Text('멤버 정보 수정'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: '이름',
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  controller: TextEditingController(text: name),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'MBTI',
                  ),
                  onChanged: (value) {
                    setState(() {
                      mbti = value;
                    });
                  },
                  controller: TextEditingController(text: mbti),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: '자신의 설명',
                  ),
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                  controller: TextEditingController(text: description),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: '장점',
                  ),
                  onChanged: (value) {
                    setState(() {
                      merit = value;
                    });
                  },
                  controller: TextEditingController(text: merit),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Style',
                  ),
                  onChanged: (value) {
                    setState(() {
                      style = value;
                    });
                  },
                  controller: TextEditingController(text: style),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('보류'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('수정'),
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('수정 완료'),
                        content: Text('수정이 완료 되었습니다!'),
                        actions: [
                          TextButton(
                            child: Text('닫기'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
                TeamMember updatedMember = TeamMember(
                  name: name,
                  mbti: mbti,
                  description: description,
                  merit: merit,
                  style: style,
                  image: teamMembers[index].image,
                  backgroundColor: teamMembers[index].backgroundColor,
                );

                setState(() {
                  teamMembers[index] = updatedMember;
                });
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                      return AlertDialog(
                          title: Text('수정 중'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          content: SizedBox(
                            height: 135,
                            child: Center(
                                child: SizedBox(
                                  child: new CircularProgressIndicator(
                                      valueColor: new AlwaysStoppedAnimation(
                                          Colors.blue),
                                      strokeWidth: 5.0),
                                  height: 50.0,
                                  width: 50.0,
                                )),
                          ));
                    });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '팀원 소개',
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMJUA',
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        actions: [
          TextButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  String name = '';
                  String mbti = '';
                  String description = '';
                  String merit = '';
                  String style = '';
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    title: Text('너 내 동료가 되라'),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: '이름',
                            ),
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'MBTI',
                            ),
                            onChanged: (value) {
                              setState(() {
                                mbti = value;
                              });
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: '자신의 설명',
                            ),
                            onChanged: (value) {
                              setState(() {
                                description = value;
                              });
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: '장점',
                            ),
                            onChanged: (value) {
                              setState(() {
                                merit = value;
                              });
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Style',
                            ),
                            onChanged: (value) {
                              setState(() {
                                style = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('보류'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('영입'),
                        onPressed: () {
                          Navigator.pop(context);
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('영입 완료'),
                                  content: Text('지금부터 이 멤버는 제껍니다!'),
                                  actions: [
                                    TextButton(
                                      child: Text('닫기'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                          TeamMember newMember = TeamMember(
                            name: name,
                            mbti: mbti,
                            description: description,
                            merit: merit,
                            style: style,
                            backgroundColor: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(Random().nextInt(0xffffffff)),
                                  Color(Random().nextInt(0xffffffff)),
                                ],
                              ),
                            ),
                            image:
                            "assets/images/img${Random().nextInt(9) + 6}.png",
                          );
                          addTeamMember(newMember);
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.pop(context);
                                });
                                return AlertDialog(
                                    title: Text('동료로 영입 중'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    content: SizedBox(
                                      height: 135,
                                      child: Center(
                                          child: SizedBox(
                                            child: new CircularProgressIndicator(
                                                valueColor: new AlwaysStoppedAnimation(
                                                    Colors.blue),
                                                strokeWidth: 5.0),
                                            height: 50.0,
                                            width: 50.0,
                                          )),
                                    ));
                              });
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFDDFAD4), // 첫 번째 색상2
              Color(0xFFE2E4E4), // 두 번째 색상
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView.builder(
              itemCount: teamMembers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            TeamMemberDetailPage(member: teamMembers[index]),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0.0, 1.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: ModalRoute.of(context)!.animation!,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          teamMembers[index].name,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'HMKMRHD',
                            color: Color(0xFF26569D),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                editTeamMember(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                deleteTeamMember(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
