import 'package:skillsavant/data/network/network_api_services.dart';
import 'package:skillsavant/resources/app_urls/app_urls.dart';
import 'package:skillsavant/utils/type_def.dart';

class LoginRepo {
  EitherResponse loginUser(userData) async => await ApiServices.postApi(userData, Appurls.userLogin);

}