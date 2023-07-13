import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PromisePage extends StatefulWidget {
  @override
  _PromisePageState createState() => _PromisePageState();
}

class _PromisePageState extends State<PromisePage> {
  TextEditingController promiseController = TextEditingController();
  List<String> promises = [];

  @override
  void initState() {
    super.initState();
    loadPromises();
  }

  Future<void> loadPromises() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      promises = prefs.getStringList('promise') ??
          [
            '1. 푸쉬할 때 알려줘라',
            '2. 사유 없이 지각하지 마라',
            '3. 소음 줄여라',
            '4. 검색하고 물어봐라',
            '5. 밥 먹을 때 조용히',
            '6. 말 없이 자리 비우지 마라',
          ];
    });
  }

  Future<void> savePromises() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('promise', promises);
  }

  void addPromise(String promise) {
    setState(() {
      promises.add(promise);
      savePromises();
    });
    promiseController.clear();
  }

  void deletePromise(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('약속 삭제'),
          content: Text('정말로 이 약속을 삭제하시겠습니까?'),
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
                  promises.removeAt(index);
                  savePromises();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void editPromise(int index) {
    String promise = promises[index];
    TextEditingController editController =
    TextEditingController(text: promise);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('약속 수정'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: '약속'),
            onChanged: (value) {
              promise = value;
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
                  promises[index] = promise;
                  savePromises();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showAddPromiseDialog() {
    String newPromise = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('새로운 약속 추가'),
          content: TextField(
            controller: promiseController,
            decoration: InputDecoration(labelText: '약속'),
            onChanged: (value) {
              newPromise = value;
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
                addPromise(newPromise);
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
        savePromises();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('약속'),
          titleTextStyle: TextStyle(
            color: Color(0xFF000000),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF000000)),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showAddPromiseDialog();
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
                Color.fromARGB(255, 160, 111, 74), // 첫 번째 색상
                Color.fromARGB(255, 255, 214, 187), // 두 번째 색상
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: promises.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        promises[index],
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 0, 43, 79),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              editPromise(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deletePromise(index);
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
