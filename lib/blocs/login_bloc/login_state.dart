part of 'login_bloc.dart';


@immutable

sealed class LoginState {}


final class LoginInitial extends LoginState {}


final class LoginLoadingState extends LoginState {}


final class LoginSuccessState extends LoginState {

  final String message;

  LoginSuccessState({required this.message});

}

final class LoginFailureState extends LoginState {

  final String message;
  
  LoginFailureState({required this.message});

}

final class LoginErrorState extends LoginState {

  final String message;
  
  LoginErrorState({required this.message});

}

