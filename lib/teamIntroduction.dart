import 'package:flutter/material.dart';
import 'teamIntroductionDetail.dart';

class TeamMember {
  final String name;
  final String mbti;
  final String description;
  final String merit;
  final String style;

  TeamMember({
    required this.name,
    required this.mbti,
    required this.description,
    required this.merit,
    required this.style,
  });
}

class TeamIntroductionPage extends StatefulWidget {
  @override
  _TeamIntroductionPageState createState() => _TeamIntroductionPageState();
}

class _TeamIntroductionPageState extends State<TeamIntroductionPage> {
  List<TeamMember> teamMembers = [
    TeamMember(
      name: '이진혁',
      mbti: 'INFJ',
      description: '사교성이 좋고 낯가림이 없는 INFJ입니다.',
      merit: '남에게 피해주기를 싫어해서 무언가 주어지면 열심히 하며 성격 또한 솔직합니다',
      style: '의견을 많이 나누면서 브레인스토밍하는걸 추구합니다.',
    ),
    TeamMember(
      name: '신민지',
      mbti: 'ISFP',
      description: '저는 신민지이고, MBTI는 ISFP입니다.',
      merit: '낯은 좀 가리지만 밝고 긍정적인 성격이며 솔직한 성격입니다.',
      style: '최대한 다른 사람의 의견을 수용하면서 소통을 하려고 합니다.',
    ),
    TeamMember(
      name: '양화진',
      mbti: 'idk',
      description: '코딩, 개발 관련 교육은 처음입니다. MBTI 검사는 한 번도 안해봤습니다.',
      merit: '초반에 낯을 조금 가리는 편이나 금방 익숙해지며 적응을 잘합니다.',
      style: '의견을 주시면 거기에 살을 붙이는 식으로 채워넣기를 잘 합니다.',
    ),
    TeamMember(
      name: '이수진',
      mbti: 'INTP',
      description: 'INTP인데, 반반 나오는 것도 있어서 MBTI를 그렇게 믿지는 않습니다.',
      merit: '회복 탄력성이 빠른 편입니다.',
      style: '팀원의 의견을 중요시하고 맡은 몫은 끝까지 해내려 합니다.',
    ),
    TeamMember(
      name: '윤승재',
      mbti: 'unexpected',
      description: '저는 예측할 수 없는 사람입니다. MBTI는 저를 완전히 담아내지 못합니다.',
      merit: '성실함(공부를 오래 해도 지치지 않음), 책임감(내가 맡은 문제는 밤을 새서라도 해결함)',
      style: '도움이 필요하실 때 말씀하시면 책임감 가지고 해결이 될 때까지 도와드리겠습니다.',
    ),
  ];

  void addTeamMember(TeamMember member) {
    setState(() {
      teamMembers.add(member);
    });
  }

  void deleteTeamMember(int index) {
    setState(() {
      teamMembers.removeAt(index);
    });
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
        child: Center(
          child: Container(

            width: 300,// 리스트의 너비를 조정하세요
            height: double.infinity,// 리스트의 높이를 조정하세요
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
                            color: Color(0xFFA8D248),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteTeamMember(index);
                          },
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
      floatingActionButton: FloatingActionButton(
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
                title: Text('새로운 멤버를 추가해주세요'),
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
                          labelText: '자신의설명',
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
    );

  }
}
