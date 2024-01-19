import 'package:skillsavant/data/network/network_api_services.dart';
import 'package:skillsavant/resources/app_urls/app_urls.dart';
import 'package:skillsavant/utils/type_def.dart';

class CpourseRepo {
  EitherResponse getPopularCourses() async => await ApiServices.getApi(Appurls.popularCourses);

}