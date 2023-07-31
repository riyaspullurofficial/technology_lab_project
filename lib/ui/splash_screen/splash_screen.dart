import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/home_dashboard_controller.dart';
import '../../utils/config/colors.dart';
import '../../utils/config/shared_preferences.dart';
import '../../utils/testing_data/image_list.dart';
import '../../utils/testing_data/strings.dart';
import '../../utils/widgets/button.dart';
import '../main_screen.dart';
import '../user_screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final homeDashboardController = Get.put(HomeDashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(horizontal: 55),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        // Enable auto-play
                        enlargeCenterPage: true,
                        // Make the selected item larger
                        aspectRatio:
                            16 / 9, // Aspect ratio of the carousel items
                        // You can customize various other options here
                      ),
                      items: imageList.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Image.asset(
                                imageUrl,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: Text(
                    splashScreenText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getAccessTokenSharedPreferences().then((value) {
                      if (value == null || value == '') {
                        Get.to(LoginScreen());
                      } else {

                        homeDashboardController.getHomeTitle(callback: (){
                          print("main sctreen");
                          Get.to(MainScreen());
                        });


                      }
                    });
                  },
                  child: loginButton(buttonText: 'Continue'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Skip for now',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                      textStyle: const TextStyle(
                          color: skip_text_color,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
