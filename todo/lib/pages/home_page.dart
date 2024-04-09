// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_import, depend_on_referenced_packages, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, prefer_final_fields, unused_field, unused_element, deprecated_member_use

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/pages/add_task_bar.dart';
import 'package:todo/pages/theme.dart';
import 'package:todo/pages/widgets/button.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/services/notification_services.dart';
import 'package:todo/pages/widgets/button.dart';



class homePage extends StatefulWidget {
  const homePage({super.key});

    
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  DateTime _selectedDate = DateTime.now();
  var notifyHelper;

    @override
   void  initState() {
     // TODO: implement initState
      super .initState();
      notifyHelper=NotifyHelper();
      notifyHelper.initializeNotification();
      notifyHelper.requestIOSPermissions();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(
      
      ),
      body:  Column(
        children: [
          _addTaskBar(),
          _addDateBar(),

        ],
      ),
    );
  }
  
  _addDateBar(){
   return  Container(
            margin: EdgeInsets.only(top:20, left:20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: primaryClr,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color:Colors.grey
              ),
              ),
              dayTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color:Colors.grey
              ),
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color:Colors.grey
              ),
              ),
              onDateChange: (date){
                 _selectedDate=date;
              },
            ),

          );

  }
 
 _addTaskBar(){
  return           Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                        style: subHeadingStyle,
                      ),
                      Text("Today",
                      style: headingStyle,
                      )
                  
                    ],
                  ),
                ),
                MyButton(label: "+ Add Task", onTap: ()=>Get.to(AddTaskPage()))
              ],
            ),
          );
 }

_appBar(){
  return AppBar(
    elevation: 0,
    backgroundColor: context.theme.backgroundColor,
    leading: GestureDetector(
      onTap: (){
       ThemeServices().switchTheme();
       var notifyHelper;
       notifyHelper.displayNotification(
         title: "Theme Changed",
         body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme"
       );

       notifyHelper.scheduledNotification();
      },
      child:  Icon(Get.isDarkMode ? Icons.wb_sunny_outlined:Icons.nightlight_round,
      size: 20,
      color:Get.isDarkMode ? Colors.white:Colors.black
      ),
    ) ,
    actions: [
    CircleAvatar(
      backgroundImage: AssetImage(
        "images/photo.jpg"
      ),
    )
    ],
  );
}
}