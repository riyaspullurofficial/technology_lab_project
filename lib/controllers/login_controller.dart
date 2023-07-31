import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:technology_lab_project/controllers/base_controller.dart';
import 'package:technology_lab_project/model/login_model/upload_model/login_upload_model.dart';

import '../model/error_model/error_response.dart';
import '../model/login_model/login_response_model.dart';
import '../model/login_model/upload_model/otp_upload_model.dart';
import '../model/login_model/verify_otp_response.dart';
import '../remote/remote_services.dart';
import '../utils/config/shared_preferences.dart';
import '../utils/config/snackbar.dart';
import '../utils/config/string_constants.dart';

class LoginController extends BaseController {
  RemoteServices remoteServices = RemoteServices();
  var loginResponse = Rxn<LoginResponse /*LoginResponseModelTest*/ >();
  var verifyOtpResponseModel = Rxn<VerifyOtpResponseModel>();

  var countryCode = "+974";
  var mobileNumber = "";
  var otp = "123456";

  void generateOTP({required Function callback}) {
    loginResponse.value = null;

    if (mobileNumber == "") {
      snackBar(snackDataString: 'Please fill data');
    } else {
      showLoader();
      print("mobile number$mobileNumber  $countryCode");

      LoginUploadModel loginUploadModel =
          LoginUploadModel(phoneCode: countryCode, phone: mobileNumber);
      RemoteServices.loginRemote(
              loginUploadModel: loginUploadModel,
              phoneCode: countryCode,
              contact: mobileNumber)
          .then((value) {
        loginResponse.value = value;

        print(
            "  generateOTP Response == status code==${value?.status}===$value");
        if (value!.status! >= 200 && value.status! < 300) {
          hideLoader();
          callback();
        }
        hideLoader();
      }).onError((error, stackTrace) {
        hideLoader();

        if (error is ErrorResponseModel) {
          if (error.message != null) {
            snackBar(snackDataString: error.message!);
          }
        } else {
          if (error is ErrorResponseModel) {
            print(error.message);
            snackBar(
                snackDataString:
                    'otpUploadRemote Api failed ==${error.message}');
          }
        }
      });
      /*   hideLoader();
      callback();*/

      /*  remoteServices.userLoginRemote(countryCode: countryCode, phone: '31404159')
          .then((value) {
        loginResponse.value = value;

        print(
            "  generateOTP Response == status code==${value?.status}===$value");
        if (value!.status! >= 200 && value.status! < 300) {
          hideLoader();
          callback();
        }
        hideLoader();
      }).onError((error, stackTrace) {
        hideLoader();

        if (error is ErrorResponseModel) {
          if (error.message != null) {
            snackBar(snackDataString: error.message!);
          }
        } else {
          snackBar(snackDataString: 'Api failed');
          if (error is ErrorResponseModel) {
            print(error.message);
          }
        }
      });*/
    }
  }

  void otpUploadRemote({required Function callback}) {
    verifyOtpResponseModel.value = null;

    if (otp == '') {
      snackBar(snackDataString: 'Please fill data');
    } else {
      showLoader();
      VerifyOtpUploadModel verifyOtpUploadModel =
          VerifyOtpUploadModel(otp: otp);
      RemoteServices.otpUploadRemote(verifyOtpUploadModel: verifyOtpUploadModel)
          .then((value) {
        verifyOtpResponseModel.value = value;

        print(
            "  otpUploadRemote Response == status code==${value?.status}===$value");
        if (verifyOtpResponseModel.value?.data?.token != null) {
          accessTokenSaveSharedPreferences(
              acsToken: verifyOtpResponseModel.value!.data!.token!);
          callback();
        }
      }).onError((error, stackTrace) {
        hideLoader();

        if (error is ErrorResponseModel) {
          if (error.message != null) {
            snackBar(snackDataString: error.message!);
          }
        } else {
          if (error is ErrorResponseModel) {
            print(error.message);
            snackBar(
                snackDataString:
                    'otpUploadRemote Api failed ==${error.message}');
          }
        }
      });
/*      accessTokenSaveSharedPreferences(acsToken: testToken);
      hideLoader();

      callback();*/
    }
  }
}
