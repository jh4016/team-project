import 'package:flutter/material.dart';

import 'HomePage.dart';

/* This is the data that we are going to use to render the grid of products using Gridview.
As pointed out by Pranay, you can use the fetched data from a remote server.
but for the sake of simplicity, I am using hardcoded data.
*/

/*중요 파일*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}