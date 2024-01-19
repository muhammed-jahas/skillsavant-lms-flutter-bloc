import 'package:flutter/material.dart';
import 'package:skillsavant/models/course_model.dart';
import 'package:skillsavant/views/video_player_screen.dart';

class CourseSingleScreen extends StatelessWidget {
  CourseModel? course;
  CourseSingleScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(course!.title, style: TextStyle(fontWeight: FontWeight.w700),),

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: VideoPlayerPage(),
              
            ),
          ],
        ),
      ),
    );
  }
}