import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  TextEditingController urlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  List<String> blogUrls = [];
  List<String> names = [];

  @override
  void initState() {
    super.initState();
    loadBlogs();
  }

  Future<void> loadBlogs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      blogUrls = prefs.getStringList('blogUrls') ??
          [
            'https://velog.io/@jh4016',
            'https://velog.io/@minjii',
            'https://ghkwls.tistory.com',
            'https://velog.io/@soojn',
            'https://velog.io/@0poison',
          ];
      names = prefs.getStringList('names') ??
          [
            '이진혁',
            '신민지',
            '양화진',
            '이수진',
            '윤승재',
          ];
    });
  }

  Future<void> saveBlogs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('blogUrls', blogUrls);
    await prefs.setStringList('names', names);
  }

  void addBlog(String url, String name) {
    setState(() {
      blogUrls.add(url);
      names.add(name);
      saveBlogs();
    });
    urlController.clear();
    nameController.clear();
  }

  void deleteBlog(int index) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              title: Text('블로그 삭제'),
              content: Text('정말로 이 블로그를 삭제하시겠습니까?'),
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
                    Navigator.pop(context);
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('삭제 완료'),
                            content: Text('삭제 되었습니다.'),
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
                      blogUrls.removeAt(index);
                      names.removeAt(index);
                      saveBlogs();
                    });
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });
                          return AlertDialog(
                              title: Text('삭제 중'),
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
                )
              ]);
        });
  }

  void editBlog(int index) {
    String initialUrl = blogUrls[index];
    String initialName = names[index];
    TextEditingController urlEditController =
        TextEditingController(text: initialUrl);
    TextEditingController nameEditController =
        TextEditingController(text: initialName);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title: Text('블로그 수정'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: urlEditController,
                decoration: InputDecoration(labelText: 'URL'),
                onChanged: (value) {
                  initialUrl = value;
                },
              ),
              TextField(
                controller: nameEditController,
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  initialName = value;
                },
              ),
            ],
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
                Navigator.pop(context);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('수정 완료'),
                        content: Text('수정 되었습니다.'),
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
                          title: Text('수정 중'),
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
                  blogUrls[index] = initialUrl;
                  names[index] = initialName;
                  saveBlogs();
                });
              },
            ),
          ],
        );
      },
    );
  }

  void showAddEntryDialog(BuildContext context) {
    String newBlogURls = '';
    String newNames = '';
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: Text('새로운 블로그 추가'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(labelText: 'URL'),
                  onChanged: (value) {
                    newBlogURls = "https://$value";
                  },
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    newNames = value;
                  },
                ),
              ],
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
                    //추가되었습니다.
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(Duration(seconds: 3), () {});
                          return AlertDialog(
                            title: Text('추가 완료'),
                            content: Text('추가 되었습니다.'),
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
                              title: Text('추가 중'),
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
                    addBlog(newBlogURls, newNames);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        saveBlogs();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xFF000000),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            '블로그',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
              fontFamily: 'BMEULJIROTTF',
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              color: Color(0xFF000000),
              onPressed: () {
                showAddEntryDialog(context);
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
                Color(0xFFB9FFCF), // 첫 번째 색상
                Color(0xFFE2BCF8), // 두 번째 색상
              ],
            ),
          ),
          child: ReorderableListView(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final String url = blogUrls.removeAt(oldIndex);
                final String name = names.removeAt(oldIndex);
                blogUrls.insert(newIndex, url);
                names.insert(newIndex, name);
                saveBlogs();
              });
            },
            children: List.generate(
              blogUrls.length,
                  (index) => ListTile(
                key: Key('$index'),
                tileColor: Colors.transparent,
                title: Text(
                  '${names[index]} ',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF49009D),
                    height: 1.4,
                    fontFamily: 'BMJUA',
                  ),
                ),
                subtitle: Text(
                  '${blogUrls[index]}',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 23,
                    fontFamily: 'BMYEONSUNG',
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        editBlog(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteBlog(index);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  if (blogUrls[index].contains('.') ||
                      blogUrls[index].contains('com') ||
                      blogUrls[index].contains('www')) {
                    launchUrl(Uri.parse(blogUrls[index]));
                  } else {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          title: Text('오류'),
                          content: Text('URL을 열 수 없습니다.'),
                          actions: [
                            TextButton(
                              child: Text('닫기'),
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                      title: Text('오류'),
                                      content: Text('검색 하시겠습니까?'),
                                      actions: [
                                        TextButton(
                                          child: Text('예'),
                                          onPressed: () {
                                            String quest = blogUrls[index]
                                                .substring(
                                                8, blogUrls[index].length)
                                                .toString();
                                            launchUrl(Uri.parse(
                                                'https://www.google.com/search?q=$quest'));
                                            Navigator.pop(context);
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                Future.delayed(
                                                  Duration(seconds: 3),
                                                      () {
                                                    Navigator.pop(context);
                                                  },
                                                );
                                                return AlertDialog(
                                                  title: Text('검색 중'),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                                  ),
                                                  content: SizedBox(
                                                    height: 135,
                                                    child: Center(
                                                      child: SizedBox(
                                                        child:
                                                        CircularProgressIndicator(
                                                          valueColor:
                                                          AlwaysStoppedAnimation(
                                                              Colors.blue),
                                                          strokeWidth: 5.0,
                                                        ),
                                                        height: 50.0,
                                                        width: 50.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        TextButton(
                                          child: Text('아니오'),
                                          onPressed: () {
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
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
