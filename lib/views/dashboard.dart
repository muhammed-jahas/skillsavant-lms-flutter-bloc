import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillsavant/blocs/course_bloc/course_bloc.dart';
import 'package:skillsavant/resources/colors/app_colors.dart';
import 'package:skillsavant/views/favourites_screen.dart';
import 'package:skillsavant/views/home_screen.dart';
import 'package:skillsavant/views/settings_scren.dart';
import 'package:skillsavant/views/user_courses_screen.dart';

class Dashboard extends StatefulWidget {
  int? newindex;
  Dashboard({Key? key, this.newindex});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    UserCoursesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.newindex ?? 0;
    loadPopularCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: BottomNavigationBar(
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade500,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 0,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.grid_view_outlined,
                      color: AppColors.secondaryColor),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.grid_view_outlined),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.search, color: AppColors.secondaryColor),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.search),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.chat_bubble_outline_outlined,
                      color: AppColors.secondaryColor),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.chat_bubble_outline_outlined),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.account_circle_outlined,
                      color: AppColors.secondaryColor),
                ),
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  child: Icon(Icons.account_circle_outlined),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadPopularCourses() async {
    context.read<CourseBloc>().add(GetPopularCourses());
  }
}
