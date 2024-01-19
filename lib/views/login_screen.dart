import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillsavant/blocs/login_bloc/login_bloc.dart';
import 'package:skillsavant/resources/colors/app_colors.dart';
import 'package:skillsavant/resources/components/buttons/custom_buttons.dart';
import 'package:skillsavant/resources/components/input_fields/input_fields.dart';
import 'package:skillsavant/resources/components/text_models/span_texts.dart';
import 'package:skillsavant/resources/constants/app_paddings.dart';
import 'package:skillsavant/resources/constants/appspaces.dart';
import 'package:skillsavant/resources/constants/mediaqueries.dart';
import 'package:skillsavant/views/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = AppMediaQueries.getDeviceHeight(context);
    double deviceWidth = AppMediaQueries.getDeviceWidth(context);

    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.secondaryColor,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: deviceHeight * .3,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/login-bg.png'),
                            ),
                          ),
                          height: deviceHeight * .2,
                        ),
                      ],
                    ),
                    Positioned(
                      top: deviceHeight * .2 - 50,
                      left: deviceWidth * .5 - 50,
                      child: Image.asset(
                        'assets/images/logo/skillsavant-logo-dark-small.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'Log in to SkillSavant',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AppSpaces.verticalspace40,
              Padding(
                padding: AppPaddings.horizontalpadding20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSpaces.verticalspace10,
                    //Email Field
                    CustomInputField(
                      hintText: 'Enter your email',
                      fieldIcon: Icons.email_outlined,
                      controller: usernameController,
                    ),
                    AppSpaces.verticalspace20,
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSpaces.verticalspace10,
                    //Password Field
                    CustomInputField(
                      hintText: 'Enter your password',
                      fieldIcon: Icons.password_outlined,
                      controller: passwordController,
                    ),
                    AppSpaces.verticalspace20,
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          print(state.message);
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Dashboard(),), (route) => false);

                          
                        } else if (state is LoginFailureState) {
                          print(state.message);
                        } else if (state is LoginErrorState) {
                          print(state.message);
                        }
                      },
                      builder: (context, state) {
                        bool isLoading =
                            state is LoginLoadingState ? true : false;
                        String username = usernameController.text;
                        String password = passwordController.text;
                        return LoadingButton(
                          isLoading: isLoading,
                          buttonText: 'Login',
                          buttonFunction: () async {
                            context.read<LoginBloc>().add(LoginUserEvent(
                                username: username, password: password));
                          },
                        );
                      },
                    ),
                    AppSpaces.verticalspace20,
                    CustomSpanText(
                      firstText: 'Don’t have an account ?',
                      spanText: 'Sign Up',
                      spanFunction: () {},
                    ),
                    AppSpaces.verticalspace20,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
