import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skillsavant/data/shared_preferences/shared_preferences.dart';
import 'package:skillsavant/repositories/login_repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>(loginUserEvent);
  }

  FutureOr<void> loginUserEvent(LoginUserEvent event, Emitter<LoginState> emit) async {
    final userData = {
      'email' : event.username,
      'password' : event.password
    };
    emit(LoginLoadingState());
    final either = await LoginRepo().loginUser(userData);
    
    either.fold((error) => emit(LoginErrorState(message: error.message)),
    (response){
      if(response['access'] != null){
        storeData(response);
        emit(LoginSuccessState(message: 'Login Successfully'));
       
      }else{
        emit(LoginFailureState(message: response['message']));
      }
    });
  }
  
   storeData(response) async {
    SharedPref.instance.sharedPref.setString(SharedPref.accessToken, response['access']);
    SharedPref.instance.sharedPref.setString(SharedPref.accessToken, response['refresh']);
    print(response['access']);
   }
}
