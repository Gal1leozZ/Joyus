import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting'),),

      body: ListView(
        children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 1.0),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Icon(Icons.edit),
                    ),
                    Expanded(
                        flex: 6,
                        child: Text(
                          'เมนูตั้งค่าการใช้งาน',
                          style: TextStyle(fontSize: 20.0),
                        )),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/43.jpg')),
                title: Text('ข้อมูลส่วนตัว'),
                subtitle: Text('จัดการข้อมูลส่วนตัวของผู้ใช้'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text('เปลี่ยนรหัสผ่าน'),
                subtitle: Text('เปลี่ยนรหัสการใช้งานแอพ'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.assignment_turned_in),
                title: Text('แจ้งเตือนการรับประทานยา'),
                subtitle: Text('สำหรับผู้ป่วยที่ต้องรับประทานยาอย่างต่อเนื่อง'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.assignment_ind),
                title: Text('แจ้งเตือนการนัดพบแพทย์'),
                subtitle: Text('สำหรับผู้ป่วยที่ต้องไปพบแพทย์'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        )
      ],
    

      ),
    );

  }
}