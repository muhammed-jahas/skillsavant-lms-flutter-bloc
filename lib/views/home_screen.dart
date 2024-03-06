import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillsavant/blocs/course_bloc/course_bloc.dart';
import 'package:skillsavant/models/course_model.dart';
import 'package:skillsavant/resources/colors/app_colors.dart';
import 'package:skillsavant/resources/constants/app_paddings.dart';
import 'package:skillsavant/resources/constants/appspaces.dart';
import 'package:skillsavant/resources/constants/mediaqueries.dart';
import 'package:skillsavant/views/course_single_screen.dart';
import 'package:skillsavant/views/video_player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondaryColor,
        statusBarIconBrightness: Brightness.light));
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFF8F8F8),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.09,
          backgroundColor: AppColors.secondaryColor,
          title: const Text(
            'WELCOME TO SKILLSAVANT, JAHAS',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.primaryColor),
          ),
          actions: const [
            CircleAvatar(),
            SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppMediaQueries.getDeviceHeight(context) * .460,
                width: AppMediaQueries.getDeviceWidth(context) * 1,
                color: AppColors.secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpaces.verticalspace20,
                    const Padding(
                      padding: AppPaddings.horizontalpadding20,
                      child: Text('Recommeneded For You',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.whiteColor,
                          )),
                    ),
                    AppSpaces.verticalspace20,
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: BlocBuilder<CourseBloc, CourseState>(
                        builder: (context, state) {
                          if (state is CourseLoadingState) {
                            CircularProgressIndicator();
                          } else if (state is CourseLoadSuccessState) {
                            return Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.15 +
                                      160, // Set a minimum height if desired
                              child: ListView.separated(
                                itemCount: state.courses.length,
                                padding: const EdgeInsets.all(0),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 20,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  CourseModel course = state.courses[index];
                                  return CourseCardSingle(course: course);
                                },
                              ),
                            );
                          } else if (state is CourseFailureState) {
                            debugPrint('Course Fetching Failed');
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              AppSpaces.verticalspace20,
              const Padding(
                padding: AppPaddings.horizontalpadding20,
                child: Text('Inspiration Starts Here',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state is CourseLoadingState) {
                      CircularProgressIndicator();
                    } else if (state is CourseLoadSuccessState) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.15 +
                            160, // Set a minimum height if desired
                        child: ListView.separated(
                          itemCount: state.courses.length,
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                          itemBuilder: (context, index) {
                            CourseModel course = state.courses[index];
                            return CourseCardSingle(course: course);
                          },
                        ),
                      );
                    } else if (state is CourseFailureState) {
                      debugPrint('Course Fetching Failed');
                    }
                    return SizedBox();
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Container(
              //     height: MediaQuery.of(context).size.height * 0.15 +
              //         160, // Set a minimum height if desired
              //     child: ListView.separated(
              //       itemCount: 4,
              //       padding: const EdgeInsets.all(0),
              //       scrollDirection: Axis.horizontal,
              //       separatorBuilder: (context, index) {
              //         return const SizedBox(
              //           width: 20,
              //         );
              //       },
              //       itemBuilder: (context, index) {
              //         return  CourseCardSingle();
              //       },
              //     ),
              //   ),
              // ),
              AppSpaces.verticalspace40,
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCardSingle extends StatelessWidget {
  CourseModel course;
  CourseCardSingle({
    required this.course,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VideoPlayerPage(),
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(course.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      child: Text(
                        course.instructorFirstName.isNotEmpty
                            ? course.instructorFirstName
                                .substring(0, 1)
                                .toUpperCase()
                            : '',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      course.instructorFirstName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          course.level,
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Learn Figma: Become Beginner to advanced. Designer Course',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, size: 18),
                            SizedBox(width: 10),
                            Text('00:00:26'),
                          ],
                        ),
                        Icon(Icons.bookmark_border_outlined, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
