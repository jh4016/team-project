import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoalPage extends StatefulWidget {
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  TextEditingController goalController = TextEditingController();
  List<String> goals = [];

  @override
  void initState() {
    super.initState();
    loadGoals();
  }

  Future<void> loadGoals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      goals = prefs.getStringList('goal') ??
          [
            '1. 성실하게 공부하자',
            '2. 잘해서 취업하자',
            '3. 알잘딱깔센',
            '4. 중꺾마',
          ];
    });
  }

  Future<void> saveGoals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('goal', goals);
  }

  void addGoal(String goal) {
    setState(() {
      goals.add(goal);
      saveGoals();
    });
    goalController.clear();
  }

  void deleteGoal(int index) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text('그것도 못하니'),
          content: Text('정말로 이 목표를 포기하시겠습니까?'),
          actions: [
            TextButton(
              child: Text('다시 도전'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('포기'),
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('지금부터'),
                        content: Text('당신은 패배자 입니다.'),
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
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                      return AlertDialog(
                          title: Text('포기 중'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          content: SizedBox(
                            height: 135,
                            child: Center(
                                child: SizedBox(
                              child: new CircularProgressIndicator(
                                  valueColor:
                                      new AlwaysStoppedAnimation(Colors.blue),
                                  strokeWidth: 5.0),
                              height: 50.0,
                              width: 50.0,
                            )),
                          ));
                    });
                setState(() {
                  goals.removeAt(index);
                  saveGoals();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void editGoal(int index) {
    String goal = goals[index];
    TextEditingController editController = TextEditingController(text: goal);

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text('그래..힘들 수도 있지'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: '목표'),
            onChanged: (value) {
              goal = value;
            },
          ),
          actions: [
            TextButton(
              child: Text('보류'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('재도전'),
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('다시'),
                        content: Text('재도전 해봅시다!'),
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
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                      return AlertDialog(
                          title: Text('계획 재수립 중'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          content: SizedBox(
                            height: 135,
                            child: Center(
                                child: SizedBox(
                              child: new CircularProgressIndicator(
                                  valueColor:
                                      new AlwaysStoppedAnimation(Colors.blue),
                                  strokeWidth: 5.0),
                              height: 50.0,
                              width: 50.0,
                            )),
                          ));
                    });
                setState(() {
                  goals[index] = goal;
                  saveGoals();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void showAddGoalDialog() {
    String newGoal = '';
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text('새로운 목표 추가'),
          content: TextField(
            controller: goalController,
            decoration: InputDecoration(labelText: '목표'),
            onChanged: (value) {
              newGoal = value;
            },
          ),
          actions: [
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('추가'),
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('추가 완료'),
                        content: Text('새로운 목표를 위해 화이팅!'),
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
                addGoal(newGoal);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                      return AlertDialog(
                          title: Text('추가 중'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          content: SizedBox(
                            height: 135,
                            child: Center(
                                child: SizedBox(
                              child: new CircularProgressIndicator(
                                  valueColor:
                                      new AlwaysStoppedAnimation(Colors.blue),
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

  void copyGoal(int index) {
    String goal = goals[index];
    Clipboard.setData(ClipboardData(text: goal));

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
        return AlertDialog(
          title: Text('클립보드에 복사 완료되었습니다'),
          content: Text('이제 자유롭게 쓰시면 됩니다'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        saveGoals();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('목표'),
          titleTextStyle: TextStyle(
            color: Color(0xFF000000),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMEULJIROTTF',
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF000000)),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showAddGoalDialog();
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 215, 135, 174), // Green color
                Color.fromARGB(255, 235, 219, 166), // White color
              ],
            ),
          ),
          child: ReorderableListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                key: Key(goals[index]),
                title: Text(
                  goals[index],
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 0, 43, 79),
                    fontWeight: FontWeight.bold,
                    fontFamily: '조선궁서체',
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        copyGoal(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        editGoal(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteGoal(index);
                      },
                    ),
                  ],
                ),
              );
            },
            itemCount: goals.length,
            onReorder: reorderPromises,
          ),
        ),
      ),
    );
  }

  void reorderPromises(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String promise = goals.removeAt(oldIndex);
      goals.insert(newIndex, promise);
      saveGoals();
    });
  }
}
