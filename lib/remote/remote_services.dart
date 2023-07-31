import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:technology_lab_project/model/login_model/login_response_model.dart';

import '../model/error_model/error_response.dart';
import '../model/home_title_model/HomeTitleModel.dart';
import '../model/home_title_model/get_categories_model.dart';
import '../model/home_title_model/get_sliders_model.dart';
import '../model/home_title_model/get_testimonial_model.dart';
import '../model/login_model/upload_model/login_upload_model.dart';
import '../model/login_model/upload_model/otp_upload_model.dart';
import '../model/login_model/verify_otp_response.dart';
import '../utils/config/api.dart';

class RemoteServices extends Interceptor {
  final Dio dio = Dio();
  static var client = http.Client();

  static var username = 'TGU12345NTAIBAAJKKLwerty@#%^&@DV@TL';
  static var password =
      'QWERqwertyuiopTYUITAIBAAzxcvbnmOP123456!@#%^&*()_+{}":><?|~78980asdfghjklATAIBAASDFGHJKLZXCVBNM';

  String createBasicAuthHeader(String username, String password) {
    String credentials = '$username:$password';
    String encodedCredentials = base64.encode(utf8.encode(credentials));
    return 'Basic $encodedCredentials';
  }

/*
  Future<LoginResponse?> userLoginRemote(
      {required String countryCode, required String phone}) async {
    String authHeader = createBasicAuthHeader(username, password);

    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    print("basicAuth $basicAuth  \n authHeader  === $authHeader  \n ++++==");

    var basc = basicAuth.replaceAll(RegExp('[^A-Za-z]'), '');

    print("\nlogin  called remote  $basc  \n");
    try {
      Response resdata = await dio.post("$baseUrl/login",
          options: Options(headers: {
            "Content-Type": "application/json",
            "uuid": "text",
            'Authorization': authHeader
          }),
          data: {"phone_code": "+974", "phone": "31404159"});

      print("data response ${resdata.data}");
      var userResponseData = LoginResponse.fromJson(resdata.data);

      print("login response== $userResponseData");

      return userResponseData;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!====');
        print('STATUS error: ${e.response?.statusCode}');
        print('DATA error: ${e.response?.data}');
        print('HEADERS error: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
  }*/

  static Future<LoginResponse? /*LoginResponseModelTest?*/ > loginRemote(
      {required LoginUploadModel loginUploadModel,
      required String phoneCode,
      required String contact}) async {
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print("basicAuth" + basicAuth + " ++++==");

    print(
        'login upload model== ${loginUploadModel.phone}=== ${loginUploadModel.phoneCode}=======$phoneCode =$contact');
    var response = await client.post(
        Uri.parse('https://technologyl3.sg-host.com/api/v1/login'),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          "uuid": "text",
          'authorization': basicAuth
        },
        body: loginUploadModelToJson(loginUploadModel));
    log("response.body${response.body}");
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      log(' loginRemote SUCCESS');
      var data = response.body;
      var otpResponse =
          loginResponseFromJson(data) /*LoginResponseModelTest.fromJson(data)*/;
      log("otpResponse.toString===$otpResponse");
      return otpResponse;
    } else {
      log(' loginRemote FAILED');
      log(' loginRemote error---');
      var errorResponse = errorResponseModelFromJson(response.body);
      return Future.error(errorResponse);
    }
  }

  static Future<VerifyOtpResponseModel?> otpUploadRemote(
      {required VerifyOtpUploadModel verifyOtpUploadModel}) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var response = await client.post(Uri.parse('$baseUrl/verifyOtp'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Accept': 'application/json',
          "uuid": "text",
          'authorization': basicAuth
        },
        body: verifyOtpUploadModelToJson(verifyOtpUploadModel));
    log(response.body);
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      log('SUCCESS');
      var data = response.body;
      var otpResponse = verifyOtpResponseModelFromJson(data);
      log(otpResponse.toString());
      return otpResponse;
    } else {
      log('FAILED');
      log('error---');
      var errorResponse = errorResponseModelFromJson(response.body);
      return Future.error(errorResponse);
    }
  }

  static Future<HomeTitleModel?> getHomeTitleRemote(
      {required String token}) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var response = await client.post(
      Uri.parse('$baseUrl/homeTitle'),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "uuid": "text",
        'authorization': basicAuth
      },
    );
    log(response.body);
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      log('SUCCESS');
      var data = response.body;
      var otpResponse = homeTitleModelFromJson(data);
      log(otpResponse.toString());
      return otpResponse;
    } else {
      log('FAILED');
      log('error---');
      var errorResponse = errorResponseModelFromJson(response.body);
      return Future.error(errorResponse);
    }
  }


  static Future<GetSlidersResponseModel?> getSlidersRemote(
      {required String token}) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var response = await client.post(
      Uri.parse('$baseUrl/getSliders'),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "uuid": "text",
        'authorization': basicAuth
      },
    );
    log("getSlidersRemote ==== ${response.body}");
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      log('SUCCESS');
      var data = response.body;
      var otpResponse = getSlidersResponseModelFromJson(data);
      log(otpResponse.toString());
      return otpResponse;
    } else {
      log('FAILED');
      log('error---');
      var errorResponse = errorResponseModelFromJson(response.body);
      return Future.error(errorResponse);
    }
  }

  /*GetCategoriesResponseModel*/

  static Future<GetCategoriesResponseModel?> getCategoriesRemote(
      {required String token}) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var response = await client.post(
      Uri.parse('$baseUrl/getCategories'),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "uuid": "text",
        'authorization': basicAuth
      },
    );
    log(" getCategoriesRemote ==== ${response.body}");
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      log('SUCCESS');
      var data = response.body;
      var otpResponse = getCategoriesResponseModelFromJson(data);
      log(otpResponse.toString());
      return otpResponse;
    } else {
      log('FAILED');
      log('error---');
      var errorResponse = errorResponseModelFromJson(response.body);
      return Future.error(errorResponse);
    }
  }

  /*GetTestimonialResponseModel*/

  static Future<GetTestimonialResponseModel?> getTestimonialRemote(
      {required String token}) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var response = await client.post(
      Uri.parse('$baseUrl/getTestimonials'),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Accept': 'application/json',
  /*      "uuid": "text",*/
        'authorization': basicAuth
      },
    );
    log(" getTestimonialRemote ==== ${response.body}");
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      log('SUCCESS');
      var data = response.body;
      var otpResponse = getTestimonialResponseModelFromJson(data);
      log(otpResponse.toString());
      return otpResponse;
    } else {
      log('FAILED');
      log('error---');
      var errorResponse = errorResponseModelFromJson(response.body);
      return Future.error(errorResponse);
    }
  }
}
