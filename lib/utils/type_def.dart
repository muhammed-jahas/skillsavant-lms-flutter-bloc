import 'package:either_dart/either.dart';
import 'package:skillsavant/data/exceptions/app_exceptions.dart';

typedef EitherResponse<T> = Future<Either<AppException, T>>;