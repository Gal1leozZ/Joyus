import 'dart:io';

import 'package:flutter/material.dart';

import '../../setting_screen.dart';
import '../reminder.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    @required this.greenColor,
  }) : super(key: key);

  final Color greenColor;

  @override
  Widget build(BuildContext context) {

    // Widget drawer = Drawer(
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: <Widget>[
    //       UserAccountsDrawerHeader(
    //         currentAccountPicture: CircleAvatar(
    //             backgroundImage: NetworkImage(
    //                 'https://randomuser.me/api/portraits/men/43.jpg')
    //             ),
    //         accountName: Text('PooH', style: TextStyle(fontSize: 25.0)),
    //         accountEmail: Text('pooh.work@gmail.com',
    //             style: TextStyle(
    //               fontSize: 15.0,
    //             )),
    //         decoration: BoxDecoration(
    //             image: DecorationImage(
    //                 fit: BoxFit.fill,
    //                 image: AssetImage('assets/images/pic3.jpg'))),
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.home),
    //         title: Text(
    //           'หน้าหลัก',
    //           style: TextStyle(fontSize: 20.0),
    //         ),
    //         subtitle: Text('หน้าเมนูใช้งานหลัก'),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         onTap: () {},
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.account_circle),
    //         title: Text(
    //           'ข้อมูลผู้ใช้',
    //           style: TextStyle(fontSize: 20.0),
    //         ),
    //         subtitle: Text('ข้อมูลผู้ใช้'),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         onTap: () {},
    //       ),
    //       // ListTile(
    //       //     leading: Icon(Icons.group),
    //       //     title: Text(
    //       //       'ผู้ใช้งานระบบ',
    //       //       style: TextStyle(fontSize: 20.0),
    //       //     ),
    //       //     subtitle: Text('ข้อมูลผู้ใช้งานในระบบ'),
    //       //     trailing: Icon(Icons.keyboard_arrow_right),
    //       //     onTap: () {
    //       //       Navigator.push(
    //       //         context,
    //       //         MaterialPageRoute(
    //       //           builder: (context) {
    //       //             return UsersScreen();
    //       //           },
    //       //         ),
    //       //       );
    //       //     }),
    //       ListTile(
    //           leading: Icon(Icons.notifications),
    //           title: Text(
    //             'เเจ้งเตือน',
    //             style: TextStyle(fontSize: 20.0),
    //           ),
    //           subtitle: Text('ตั้งค่าการแจ้งเตือน'),
    //           trailing: Icon(Icons.keyboard_arrow_right),
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) {
    //                   // return notification();
    //                   return reMinder();
    //                 },
    //               ),
    //             );
    //           }),
    //       ListTile(
    //           leading: Icon(Icons.settings),
    //           title: Text(
    //             'ตั้งค่า',
    //             style: TextStyle(fontSize: 20.0),
    //           ),
    //           subtitle: Text('ตั้งค่าการใช้งาน'),
    //           trailing: Icon(Icons.keyboard_arrow_right),
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) {
    //                   return SettingScreen();
    //                 },
    //               ),
    //             );
    //           }),
    //       Divider(),
    //       ListTile(
    //         title: Text(
    //           'ออกจากแอพพลิเคชั่น',
    //           style: TextStyle(fontSize: 20.0),
    //         ),
    //         subtitle: Text('ออกจากแอพ'),
    //         trailing: Icon(Icons.exit_to_app),
    //         onTap: () {
    //           exit(0);
    //         },
    //       ),
    //     ],
    //   ),
    // );


    final deviceWidth = MediaQuery.of(context).size.width;

      

    return Container(
      color: greenColor,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          // Text(
          //   'แจ้งเตือนการรับประทานยา',
          //   style: TextStyle(
          //     fontFamily: 'supermarket',
          //     color: Colors.white,
          //     //fontWeight: FontWeight.w600,
          //     fontSize: 25,
          //   ),
          //   textAlign: TextAlign.start,
          // ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );



    
  }
}
