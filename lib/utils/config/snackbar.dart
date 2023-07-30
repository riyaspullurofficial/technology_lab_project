

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void snackBar({required String snackDataString}) {
  Get.snackbar('', snackDataString, duration: const Duration(seconds: 3));
}
