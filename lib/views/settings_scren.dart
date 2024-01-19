import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillsavant/resources/colors/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  
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
          title: Text('Settings',style: TextStyle(
            fontWeight: FontWeight.w600
          ),),
        ),
        body: Center(
          child: Text('Settings', style: TextStyle(
            fontWeight: FontWeight.w600
          ),
          ),
        ),
      ),
    );
  }
}