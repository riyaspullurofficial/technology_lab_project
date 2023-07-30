import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/config/colors.dart';
import '../../utils/config/media_query_width_height.dart';

class DrawerSection extends StatelessWidget {
  DrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: mediaQueryHeight(context: context) / 1.1,
            width: mediaQueryWidth(context: context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: mediaQueryHeight(context: context) / 5,
                      width: double.infinity,
                      color: button_color,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Image.asset(
                              'asset/logo/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'RRR',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(color: Colors.white,
                                        wordSpacing: 1,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Welcome back',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        wordSpacing: 1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout,
                        size: 35,
                      ),
                    ),
                    Text('Logout',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: button_color,
                                wordSpacing: 1,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
