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
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                setState(() {
                  blogUrls.removeAt(index);
                  names.removeAt(index);
                  saveBlogs();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void editBlog(int index) {
    String initialUrl = blogUrls[index];
    String initialName = names[index];
    TextEditingController urlEditController =
    TextEditingController(text: initialUrl);
    TextEditingController nameEditController =
    TextEditingController(text: initialName);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('블로그 수정'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: urlEditController,
                decoration: InputDecoration(labelText: 'URL'),
              ),
              TextField(
                controller: nameEditController,
                decoration: InputDecoration(labelText: 'Name'),
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
                setState(() {
                  blogUrls[index] = initialUrl;
                  names[index] = initialName;
                  saveBlogs();
                });
                Navigator.pop(context);
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
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('새로운 블로그 추가'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: urlController,
                decoration: InputDecoration(labelText: 'URL'),
                onChanged: (value) {
                  newBlogURls = value;
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
                addBlog(newBlogURls, newNames);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void launchUrl(Uri uri) async {
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('오류'),
            content: Text('URL을 열 수 없습니다.'),
            actions: [
              TextButton(
                child: Text('닫기'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
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
              fontFamily: 'BMEULIROTTF',
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
          child: Center(
            child: ListView.builder(
              itemCount: blogUrls.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF49009D),
                                height: 1.4,
                              ),
                              children: [
                                TextSpan(
                                  text: "${names[index]} : ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'BMJUA',
                                  ),
                                ),
                                TextSpan(
                                  text: blogUrls[index],
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'BMYEONSUNG',
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchUrl(Uri.parse(blogUrls[index]));
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
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