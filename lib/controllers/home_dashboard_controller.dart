import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:technology_lab_project/controllers/base_controller.dart';

import '../model/error_model/error_response.dart';
import '../model/home_title_model/HomeTitleModel.dart';
import '../model/home_title_model/get_categories_model.dart';
import '../model/home_title_model/get_sliders_model.dart';
import '../model/home_title_model/get_testimonial_model.dart';
import '../remote/remote_services.dart';
import '../utils/config/shared_preferences.dart';
import '../utils/config/snackbar.dart';

class HomeDashboardController extends BaseController {
  var homeTitleModel = Rxn<HomeTitleModel>();
  var getSlidersResponseModel = Rxn<GetSlidersResponseModel>();
  var getCategoriesResponseModel = Rxn<GetCategoriesResponseModel>();
  var getTestimonialResponseModel = Rxn<GetTestimonialResponseModel>();

  @override
  void onInit() {
    getHomeTitle(callback: () {});
    getSliderResponse(callback: () {});
    getCategoriesResponse(callback: () {});
    getTestimonialResponse(callback: () {});
    super.onInit();
  }

  void getHomeTitle({required Function callback}) {
    getAccessTokenSharedPreferences().then((value) {
      if (value != null) {
        showLoader();
        RemoteServices.getHomeTitleRemote(token: value).then((valueResponse) {
          homeTitleModel.value = valueResponse;
          hideLoader();
          callback();

          /*   if (valueResponse?.status != null) {

            if (valueResponse!.status! >= 200 && valueResponse.status! < 300) {
              callback();
            } else {
              print('home title status not 200');
            }
          } else {
            print('home title status null');
          }*/
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
                  snackDataString: 'home title Api failed ${error.message}');
            }
          }
        });
      }
    });
  }

  void getSliderResponse({required Function callback}) {
    getAccessTokenSharedPreferences().then((value) {
      if (value != null) {
        showLoader();
        RemoteServices.getSlidersRemote(token: value).then((valueResponse) {
          getSlidersResponseModel.value = valueResponse;
          hideLoader();
          callback();

          /*   if (valueResponse?.status != null) {

            if (valueResponse!.status! >= 200 && valueResponse.status! < 300) {
              callback();
            } else {
              print('home title status not 200');
            }
          } else {
            print('home title status null');
          }*/
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
                      'getSlidersResponseModel home title Api failed ${error.message}');
            }
          }
        });
      }
    });
  }

  void getCategoriesResponse({required Function callback}) {
    getAccessTokenSharedPreferences().then((value) {
      if (value != null) {
        showLoader();
        RemoteServices.getCategoriesRemote(token: value).then((valueResponse) {
          getCategoriesResponseModel.value = valueResponse;
          hideLoader();
          callback();

          /*   if (valueResponse?.status != null) {

            if (valueResponse!.status! >= 200 && valueResponse.status! < 300) {
              callback();
            } else {
              print('home title status not 200');
            }
          } else {
            print('home title status null');
          }*/
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
                      'getSlidersResponseModel home title Api failed ${error.message}');
            }
          }
        });
      }
    });
  }

  void getTestimonialResponse({required Function callback}) {
    getAccessTokenSharedPreferences().then((value) {
      if (value != null) {
        showLoader();
        RemoteServices.getTestimonialRemote(token: value).then((valueResponse) {
          getTestimonialResponseModel.value = valueResponse;
          hideLoader();
          callback();

          /*   if (valueResponse?.status != null) {

            if (valueResponse!.status! >= 200 && valueResponse.status! < 300) {
              callback();
            } else {
              print('home title status not 200');
            }
          } else {
            print('home title status null');
          }*/
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
                      'getSlidersResponseModel home title Api failed ${error.message}');
            }
          }
        });
      }
    });
  }
}
