import 'package:flutter/material.dart';

import '../../utils/config/media_query_width_height.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(
      color: Colors.yellow,
      height: mediaQueryHeight(context:context),width: mediaQueryWidth(context: context),),),);
  }
}
