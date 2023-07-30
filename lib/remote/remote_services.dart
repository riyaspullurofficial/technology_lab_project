import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:technology_lab_project/model/login_model/login_response_model.dart';

import '../model/error_model/error_response.dart';
import '../model/login_model/upload_model/login_upload_model.dart';
import '../model/login_model/upload_model/otp_upload_model.dart';
import '../model/login_model/verify_otp_response.dart';
import '../utils/config/api.dart';

class RemoteServices extends Interceptor {
  static var client = http.Client();

  static Future<LoginResponse?> loginRemote(
      {required LoginUploadModel loginUploadModel}) async {
    var username = 'TGU12345NTAIBAAJKKLwerty@#%^&@DV@TL';
    var password =
        'QWERqwertyuiopTYUITAIBAAzxcvbnmOP123456!@#%^&*()_+{}":><?|~78980asdfghjklATAIBAASDFGHJKLZXCVBNM';

    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var response = await client.post(Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'authorization': basicAuth
        },
        body: loginUploadModelToJson(loginUploadModel));
    log(response.body);
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      log('SUCCESS');
      var data = response.body;
      var otpResponse = loginResponseFromJson(data);
      log(otpResponse.toString());
      return otpResponse;
    } else {
      log('FAILED');
      log('error---');
      var errorResponse = errorResponseModelFromJson(response.body);
      return Future.error(errorResponse);
    }
  }

  static Future<VerifyOtpResponseModel?> otpUploadRemote(
      {required VerifyOtpUploadModel verifyOtpUploadModel}) async {
    var username = 'TGU12345NTAIBAAJKKLwerty@#%^&@DV@TL';
    var password =
        'QWERqwertyuiopTYUITAIBAAzxcvbnmOP123456!@#%^&*()_+{}":><?|~78980asdfghjklATAIBAASDFGHJKLZXCVBNM';

    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    var response = await client.post(Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'authorization': basicAuth
        },
        body: verifyOtpUploadModelToJson(verifyOtpUploadModel));
        log(response.body);
    if (response.statusCode >= 200 || response.statusCode <= 299) {
      log('SUCCESS');
      var data = response.body;
      var otpResponse =verifyOtpResponseModelFromJson(data);
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
