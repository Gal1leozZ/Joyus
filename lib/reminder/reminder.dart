import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joyus_app/reminder/widgets/AddMedicine.dart';
import 'package:joyus_app/reminder/widgets/AppBar.dart';
import 'package:joyus_app/reminder/widgets/DeleteIcon.dart';
import 'package:joyus_app/reminder/widgets/MedicineEmptyState.dart';
import 'package:joyus_app/reminder/widgets/MedicineGridView.dart';
import 'package:scoped_model/scoped_model.dart';

import 'animations/fade_animation.dart';
import 'enums/icon_enum.dart';
import 'models/Medicine.dart';

class reMinder extends StatelessWidget {
  @override

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('แจ้งเตือนการรับประทานยา'),
        ),
        body: Container(
          child: GestureDetector(
          onTap: () {
            // dismiss the keyboard or focus
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
            
            // title: 'แจ้งเตือนการรับประทานยา',
            // title: 'Medicine Reminder',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color(0xFF6F35A5),
              accentColor: Color(0xFF6F35A5),
            ),
            home: MyMedicineRemainder(),
          ),
        ),
      

        ),
              );
    }
  }


class MyMedicineRemainder extends StatefulWidget {
  MyMedicineRemainder();

  @override
  _MyMedicineReminder createState() => _MyMedicineReminder();
}

class _MyMedicineReminder extends State<MyMedicineRemainder> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    MedicineModel model;
    return ScopedModel<MedicineModel>(
      model: model = MedicineModel(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              buildBottomSheet(deviceHeight, model);
            },
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).accentColor,
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                // MyAppBar(greenColor: Theme.of(context).primaryColor),
                Expanded(
                  child: ScopedModelDescendant<MedicineModel>(
                    builder: (context, child, model) {
                      return Stack(children: <Widget>[
                        buildMedicinesView(model),
                        (model.getCurrentIconState() == DeleteIconState.hide)
                            ? Container()
                            : DeleteIcon()
                      ]);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  FutureBuilder buildMedicinesView(model) {
    return FutureBuilder(
      future: model.getMedicineList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          if (snapshot.data.length == 0) {
            // No data
            return Center(child: MedicineEmptyState());
          }
          return MedicineGridView(snapshot.data);
        }
        return (Container());
      },
    );
  }

  void buildBottomSheet(double height, MedicineModel model) async {
    var medicineId = await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FadeAnimation(
            .6,
            AddMedicine(height, model.getDatabase(), model.notificationManager),
          );
        });

    if (medicineId != null) {
      Fluttertoast.showToast(
          msg: "ยาถูกเพิ่ม",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Theme.of(context).accentColor,
          textColor: Colors.white,
          fontSize: 20.0);

      setState(() {});
    }
  }
}
