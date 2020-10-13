import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joyus_app/chatbot/chatbot.dart';
import 'package:joyus_app/constants.dart';
import 'package:joyus_app/diary/diary_home.dart';
import 'package:joyus_app/diary/screens/home_diary.dart';

import 'package:flutter_svg/svg.dart';
import 'package:joyus_app/home/constants.dart';
import 'package:joyus_app/home/screens/details_screen.dart';
import 'package:joyus_app/home/widgets/bottom_nav_bar.dart';
import 'package:joyus_app/home/widgets/category_card.dart';
import 'package:joyus_app/home/widgets/search_bar.dart';

import 'package:joyus_app/notification.dart';
import 'package:joyus_app/questionnair/models/question.dart';
import 'package:joyus_app/questionnair/screens/home_screen.dart';
import 'package:joyus_app/reminder/reminder.dart';
import 'package:joyus_app/setting_screen.dart';
import 'package:joyus_app/users_screen.dart';

import 'griddashboard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextStyle mystyle = TextStyle(fontSize: 25.0);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget appBar = AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Joyus',
          style: mystyle,
        ),
      ),
      // actions: <Widget>[
      //   IconButton(
      //       icon: Icon(Icons.home),
      //       onPressed: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) {
      //                 return Homescreen();
      //               },
      //             ),
      //           );
      //       }),
      //   IconButton(
      //       icon: Icon(Icons.account_circle),
      //       onPressed: () => Navigator.of(context).pushNamed('/add')),
      // ],
    );

    Widget bottomNavbar = BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('หน้าหลัก')),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), title: Text('ข้อมูลส่วนตัว')),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), title: Text('ตั้งค่า'))
    ]);

    Widget drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/43.jpg')),
            accountName: Text('PooH', style: TextStyle(fontSize: 25.0)),
            accountEmail: Text('pooh.work@gmail.com',
                style: TextStyle(
                  fontSize: 15.0,
                )),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/pic3.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'หน้าหลัก',
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text('หน้าเมนูใช้งานหลัก'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    // return notification();
                    return Homescreen();
                  },
                ),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.account_circle),
          //   title: Text(
          //     'ข้อมูลผู้ใช้',
          //     style: TextStyle(fontSize: 20.0),
          //   ),
          //   subtitle: Text('ข้อมูลผู้ใช้'),
          //   trailing: Icon(Icons.keyboard_arrow_right),
          //   onTap: () {},
          // ),
          // ListTile(
          //     leading: Icon(Icons.group),
          //     title: Text(
          //       'ผู้ใช้งานระบบ',
          //       style: TextStyle(fontSize: 20.0),
          //     ),
          //     subtitle: Text('ข้อมูลผู้ใช้งานในระบบ'),
          //     trailing: Icon(Icons.keyboard_arrow_right),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) {
          //             return UsersScreen();
          //           },
          //         ),
          //       );
          //     }),

          ListTile(
              leading: Icon(Icons.list),
              title: Text(
                'แบบทดสอบโรคซึมเศร้า',
                style: TextStyle(fontSize: 20.0),
              ),
              subtitle: Text('แบบทดสอบเพื่อวัดระดับความซึมเศร้า'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return notification();
                      return HomeScreen_Q();
                    },
                  ),
                );
              }),

          ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text(
                'คุยกับจอย',
                style: TextStyle(fontSize: 20.0),
              ),
              subtitle: Text('เพื่อนคุยแก้เหงา'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return notification();
                      return Chatbot_Screen();
                    },
                  ),
                );
              }),
          ListTile(
              leading: Icon(Icons.event_note),
              title: Text(
                'ไดอารี่',
                style: TextStyle(fontSize: 20.0),
              ),
              subtitle: Text('บันทึกสิ่งที่เจอมาแต่ละวัน'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return notification();
                      return MyHomePage_Diary();
                    },
                  ),
                );
              }),

          ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                'เเจ้งเตือนการรับประทานยา',
                style: TextStyle(fontSize: 20.0),
              ),
              subtitle: Text('ตั้งค่าแจ้งเตือนการรับประทานยา'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return notification();
                      return reMinder();
                    },
                  ),
                );
              }),

          ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'ตั้งค่า',
                style: TextStyle(fontSize: 20.0),
              ),
              subtitle: Text('ตั้งค่าการใช้งาน'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingScreen();
                    },
                  ),
                );
              }),
          Divider(),
          ListTile(
            title: Text(
              'ออกจากแอพพลิเคชั่น',
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text('ออกจากแอพ'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      //bottomNavigationBar: bottomNavbar,

      // backgroundColor: Color(0xff392850),
      // body: Column(
      //   children: <Widget>[
      //     SizedBox(
      //       height: 20,
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(left: 16, right: 16),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text(
      //                 "Welcome to JOYUS",
      //                 style: GoogleFonts.openSans(
      //                     textStyle: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.bold)),
      //               ),
      //               SizedBox(
      //                 height: 4,
      //               ),
      //               Text(
      //                 "Home",
      //                 style: GoogleFonts.openSans(
      //                     textStyle: TextStyle(
      //                         color: Color(0xffa29aac),
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.w600)),
      //               ),
      //             ],
      //           ),
      //           IconButton(
      //             alignment: Alignment.topCenter,
      //             icon: Image.asset(
      //               "assets/notification.png",
      //               width: 24,
      //             ),
      //             onPressed: () {},
      //           )
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 25,
      //     ),
      //   GridDashboard()
      //   ],
      // ),

      // bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .90,
            decoration: BoxDecoration(
              // color: Color(0xFFF5CEB8),
              color: kPrimaryLightColor,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     height: 52,
                  //     width: 52,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFFF2BEA1),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     // child: SvgPicture.asset("assets/icons/menu.svg"),
                  //   ),
                  // ),
                  // Text(
                  //   "Good Mornign \nShishir",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .display1
                  //       .copyWith(fontWeight: FontWeight.w900),
                  // ),
                  // SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "แบบประเมินโรคซึมเศร้า",
                          svgSrc: "assets/icons/question.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HomeScreen_Q();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "คุยกับจอย",
                          svgSrc: "assets/icons/chatt.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Chatbot_Screen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "ไดอารี่",
                          svgSrc: "assets/icons/diary.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MyHomePage_Diary();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "แจ้งเตือนรับประทานยา",
                          svgSrc: "assets/icons/drug.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return reMinder();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "แจ้งเตือนนัดพบแพทย์",
                          svgSrc: "assets/icons/doctor.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "ตั้งค่า",
                          svgSrc: "assets/icons/setting.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
