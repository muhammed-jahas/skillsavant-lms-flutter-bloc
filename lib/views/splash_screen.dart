import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillsavant/data/shared_preferences/shared_preferences.dart';
import 'package:skillsavant/resources/colors/app_colors.dart';
import 'package:skillsavant/views/dashboard.dart';
import 'package:skillsavant/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    validateUser();
    // getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondaryColor,
        statusBarIconBrightness: Brightness.light));
    return const Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/logo/skillsavant-logo.png',
              ),
              fit: BoxFit.cover,
              height: 50,
            ),
          )
        ],
      ),
    );
  }

  void validateUser() async {
    final accessToken = await SharedPref.instance.getAccessToken();
    if (accessToken != null) {
      await gotoDasboard(context);
    } else {
      await gotoWelcome(context);
    }
  }

  gotoWelcome(BuildContext ctx) async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  gotoDasboard(BuildContext ctx) async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (context) =>  Dashboard()));
  }
}
