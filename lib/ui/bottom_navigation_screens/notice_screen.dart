import 'package:flutter/material.dart';

import '../../utils/config/media_query_width_height.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          height: mediaQueryHeight(context: context),
          width: mediaQueryWidth(context: context),
        ),
      ),
    );
  }
}
