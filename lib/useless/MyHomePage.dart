// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'main.dart';
//
// class MyHomePage extends StatelessWidget {
//   List data = [
//     {
//       "name": "팀원소개",
//       "imgUrl":
//       "https://t1.daumcdn.net/thumb/R720x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/JIE/image/Jq4if78e5S6_00BHfwSYoxdchlI.jpg",
//     },
//     {
//       "name": "목표",
//       "imgUrl":
//       "https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=13221732&filePath=L2Rpc2sxL25ld2RhdGEvMjAxOS8yMS9DTFMxMDAwNC8xMzIyMTczMl9XUlRfMjAxOTExMjFfMQ==&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10004",
//     },
//     {
//       "name": "약속",
//       "imgUrl":
//       "https://english.koreadaily.com/wp-content/uploads/2019/10/Copy-of-Featured-Image-4-2.jpg",
//     },
//     {
//       "name": "블로그",
//       "imgUrl":
//       "https://blog.kakaocdn.net/dn/XVMFX/btqyseZTBHR/0AeJnTycMLrOn2udXIYcSk/img.png",
//     },
//   ];
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(title),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           String name = data[index]['name'];
//           String imgUrl = data[index]['imgUrl'];
//
//           return Card(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Image.network(
//                   imgUrl,
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 200,
//                    color:  Color(0xFF000000).withOpacity(0.5),
//                 ),
//                 Text(
//                   name,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 36,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// /*
// The following widget tasked the product object that we passed in
// Navigator, and displays the data of that particular product.
// */
//
