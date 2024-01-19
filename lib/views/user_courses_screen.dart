import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillsavant/resources/colors/app_colors.dart';

class UserCoursesScreen extends StatelessWidget {
  const UserCoursesScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.whiteColor,
        statusBarIconBrightness: Brightness.dark));
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber
        ,
        appBar: AppBar(
          title: Text('My Courses',style: TextStyle(
            fontWeight: FontWeight.w600
          ),),
        ),
        body: Center(
          child: Text('My Courses', style: TextStyle(
            fontWeight: FontWeight.w600
          ),
          ),
        ),
      ),
    );
  }
}