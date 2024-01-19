import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skillsavant/models/course_model.dart';
import 'package:skillsavant/repositories/course_repo/course_repo.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<GetPopularCourses>(courseFetchEvent);
  }

  FutureOr<void> courseFetchEvent(event, emit) async {
    emit(CourseLoadingState());
    final either = await CpourseRepo().getPopularCourses();

    either.fold((error) => emit(CourseErrorState(message: error.message)),
        (response) {
      final List rawData = response;
      print(rawData);
      final List<CourseModel> courses =
          rawData.map((e) => CourseModel.fromJson(e)).toList();
      print(courses);
      emit(CourseLoadSuccessState(courses: courses));
    });
  }
}
