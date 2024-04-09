// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
_appBar(BuildContext context){
  return AppBar(
 
    leading: GestureDetector(
      onTap: (){
        Get.back();
      },
      child:  Icon(Icons.arrow_back,
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
