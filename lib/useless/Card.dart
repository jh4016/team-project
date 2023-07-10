// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(), // 홈페이지 보여주기
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> dataList = [
//       {
//         "name": "팀원소개",
//         "imgUrl":
//         "https://t1.daumcdn.net/thumb/R720x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/JIE/image/Jq4if78e5S6_00BHfwSYoxdchlI.jpg",
//       },
//       {
//         "name": "목표",
//         "imgUrl":
//         "https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=13221732&filePath=L2Rpc2sxL25ld2RhdGEvMjAxOS8yMS9DTFMxMDAwNC8xMzIyMTczMl9XUlRfMjAxOTExMjFfMQ==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10004",
//       },
//       {
//         "name": "약속",
//         "imgUrl":
//         "https://english.koreadaily.com/wp-content/uploads/2019/10/Copy-of-Featured-Image-4-2.jpg",
//       },
//       {
//         "name": "블로그",
//         "imgUrl":
//         "https://blog.kakaocdn.net/dn/XVMFX/btqyseZTBHR/0AeJnTycMLrOn2udXIYcSk/img.png",
//       },
//     ];
//
//     // 화면에 보이는 영역
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         centerTitle: false,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           "팀 소개",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//           ),
//           Divider(height: 1),
//           Expanded(
//             child: ListView.builder(
//               itemCount: dataList.length,
//               itemBuilder: (context, index) {
//                 String name = dataList[index]['name'];
//                 String imgUrl = dataList[index]['imgUrl'];
//
//                 return Card(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Image.network(
//                         imgUrl,
//                         width: double.infinity,
//                         height: 200,
//                         fit: BoxFit.cover,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         height: 200,
//                         color: Colors.black.withOpacity(0.5),
//                       ),
//                       Text(
//                         name,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }