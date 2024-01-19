import 'dart:convert';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:skillsavant/data/exceptions/app_exceptions.dart';
import 'package:skillsavant/utils/type_def.dart';

class ApiServices {
  static final _headers = {'Content-Type': 'application/json'};

  //Post Api
  static EitherResponse<Map> postApi(var data, String apiurl) async {
    if (kDebugMode) {
      print('ApiUrl:$apiurl');
      print('Data:$data');
    }
    Map FetchedData = {};
    final url = Uri.parse(apiurl);
    final body = jsonEncode(data);

    late http.Response response;
    try {
      response = await http.post(url, body: body, headers: _headers);
      FetchedData = getResponse(response);
    } catch (e) {
      if (e is AppException) {
        final errorResponse = jsonDecode(response.body);
        print(errorResponse);
        return Left(
            BadRequestException(errormessage: errorResponse['message']));
      }
    }
    return Right(FetchedData);
  }

  //Get Api
  static EitherResponse<dynamic> getApi(String apiurl) async {
    final url = Uri.parse(apiurl);
     dynamic FetchedData;

    print('In Api Service');
    try {
      final response = await http.get(url,headers: _headers);
      print(response.statusCode);
      print(jsonDecode(response.body));
      
      FetchedData = jsonDecode(response.body);
      print('111');
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOUtException());
    } catch (e) {
      print('In Catch');
      return Left(e as AppException);
    }
    // if(kDebugMode){
    //   print('ApiUrl:$apiurl');
    //   print('Data:$fetchedData');

    // }
    return Right(FetchedData);
  }

  //Put Api
  // Put Api
  static EitherResponse<Map> putApi(var data, String apiurl) async {
    if (kDebugMode) {
      print('ApiUrl: $apiurl');
      print('Data: $data');
    }

    Map<String, dynamic> fetchedData = {};
    final url = Uri.parse(apiurl);

    try {
      final response = await http.put(
        url,
        body: data.isNotEmpty ? jsonEncode(data) : null,
        headers: _headers,
      );

      // fetchedData = getResponse(response);
    } catch (e) {
      return Left(e as AppException);
    }

    return Right(fetchedData);
  }

  //Responses
  static Map getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return (jsonDecode(response.body));
      case 400:
        throw BadRequestException(errormessage: '');
      default:
        throw BadRequestException(errormessage: '');
    }
  }
}
