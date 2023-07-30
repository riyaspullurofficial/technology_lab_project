

import 'package:shared_preferences/shared_preferences.dart';
import 'package:technology_lab_project/utils/config/string_constants.dart';

Future<void> accessTokenSaveSharedPreferences(
    {required String? acsToken}) async {
  final sp = await SharedPreferences.getInstance();
  await sp.setString(sharedPrefLoginKey, acsToken!);
}

Future<String?> getAccessTokenSharedPreferences() async {
  final sp = await SharedPreferences.getInstance();

  var acTokensFromSp = sp.getString(sharedPrefLoginKey);
  print("your sp token=${acTokensFromSp}");

  return acTokensFromSp;
}