// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travel/presentation/blocs/profile/profile_bloc.dart';

// class UserInfoPanel extends StatelessWidget {
//   final String nickname;
//   final int level;
//   final int followNum;
//   final int fansNum;
//   final int visitedNum;

//   const UserInfoPanel({
//     Key key,
//     this.nickname,
//     this.level,
//     this.followNum,
//     this.fansNum,
//     this.visitedNum,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Container(
//         color: Colors.white,
//         padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
//         child: Column(
//           children: <Widget>[
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 BlocBuilder<ProfileBloc, ProfileState>(
//                   builder: (context, state) {
//                     if (state is ProfileReady) {
//                       return Text(
//                         state.user.nickname,
//                         style: TextStyle(
//                           fontSize: 23.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     }
//                   },
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.only(left: 5.0),
//                   padding: EdgeInsets.only(
//                     top: 2.0,
//                     bottom: 2.0,
//                     left: 3.0,
//                     right: 3.0,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5.0),
//                     color: Color.fromRGBO(70, 130, 255, 1.0),
//                   ),
//                   child: Text(
//                     'LV.$level',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 11.0,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             BlocBuilder<ProfileBloc, ProfileState>(
//               builder: (context, state) {
//                 if (state is ProfileReady) {
//                   return Row(
//                     children: <Widget>[
//                       _numberInfo(state.user.followNum, '关注'),
//                       _numberInfo(state.user.fansNum, '粉丝'),
//                       _numberInfo(state.user.visitedNum, '来访'),
//                     ],
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _numberInfo(int num, String label) {
//     return Container(
//       margin: EdgeInsets.only(
//         right: 15.0,
//         top: 8.0,
//       ),
//       child: Row(
//         children: <Widget>[
//           Text(
//             '$num',
//             style: TextStyle(
//               fontSize: 15.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             width: 4.0,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12.0,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
