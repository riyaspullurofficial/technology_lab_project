import 'package:flutter/material.dart';

import '../../utils/config/media_query_width_height.dart';

class MyTicketScreen extends StatelessWidget {
  const MyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(
      color: Colors.red,
      height: mediaQueryHeight(context:context),width: mediaQueryWidth(context: context),),),);
  }
}
