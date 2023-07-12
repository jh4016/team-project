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
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('니 팀 버려?'),
          content: Text('정말로 이 팀원을 떠나보내시겠습니까?'),
          actions: [
            TextButton(
              child: Text('아니오'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('예(이별합니다.)'),
              onPressed: () {
                setState(() {
                  teamMembers.removeAt(index);
                });
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
      builder: (BuildContext context) {
        String name = teamMembers[index].name;
        String mbti = teamMembers[index].mbti;
        String description = teamMembers[index].description;
        String merit = teamMembers[index].merit;
        String style = teamMembers[index].style;

        return AlertDialog(
          title: Text('팀원 정보 수정'),
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
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                TeamMember updatedMember = TeamMember(
                  name: name,
                  mbti: mbti,
                  description: description,
                  merit: merit,
                  style: style,
                  image: teamMembers[index].image,
                  backgroundColor: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFE5D8C2), // 그라데이션 색상 1
                        Color(0xFFD02EA2), // 그라데이션 색상 2
                      ],
                    ),
                  ),
                );

                setState(() {
                  teamMembers[index] = updatedMember;
                });

                Navigator.pop(context);
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
        title: Text('팀원 소개'),
        titleTextStyle: TextStyle(
          color: Color(0xFF000000),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        actions: [
          TextButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String name = '';
                  String mbti = '';
                  String description = '';
                  String merit = '';
                  String style = '';

                  return AlertDialog(
                    title: Text('새로운 멤버 추가'),
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
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('Add'),
                        onPressed: () {
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
                            image: "assets/images/img${Random().nextInt(9) + 6}.png",
                          );
                          addTeamMember(newMember);
                          Navigator.pop(context);
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
                            fontFamily: 'human',
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
