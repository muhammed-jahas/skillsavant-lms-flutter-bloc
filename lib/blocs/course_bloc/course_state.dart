part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoadingState extends CourseState{}

final class CourseLoadSuccessState extends CourseState {

  final List<CourseModel> courses;
  CourseLoadSuccessState({required this.courses});
}

final class CourseFailureState extends CourseState {

  final String message;
  CourseFailureState({required this.message});
}

final class CourseErrorState extends CourseState {

  final String message;
  CourseErrorState({required this.message});
}



