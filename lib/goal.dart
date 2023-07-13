import 'package:flutter/material.dart';
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
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('목표 삭제'),
          content: Text('정말로 이 목표를 삭제하시겠습니까?'),
          actions: [
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('삭제'),
              onPressed: () {
                setState(() {
                  goals.removeAt(index);
                  saveGoals();
                });
                Navigator.pop(context);
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
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('목표 수정'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: '목표'),
            onChanged: (value) {
              goal = value;
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
              child: Text('저장'),
              onPressed: () {
                setState(() {
                  goals[index] = goal;
                  saveGoals();
                });
                Navigator.pop(context);
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
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                addGoal(newGoal);
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
            fontFamily: 'batang',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        goals[index],
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 13, 23, 41),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'batang',
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
