import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technology_lab_project/utils/config/spacing.dart';

import '../../controllers/home_dashboard_controller.dart';
import '../../utils/config/colors.dart';
import '../../utils/config/home_title_proces.dart';
import '../../utils/config/media_query_width_height.dart';
import '../../utils/testing_data/image_list.dart';
import '../../utils/testing_data/strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeDashboardController = Get.put(HomeDashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              /*       height: mediaQueryHeight(context: context) / 1.239,*/
              width: mediaQueryWidth(context: context),
              color: button_color,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        height: mediaQueryHeight(context: context) / 5.5,
                        width: mediaQueryWidth(context: context),
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                homeDashboardController.homeTitleModel.value
                                            ?.data?.eTitle ==
                                        null
                                    ? splashScreenText
                                    : titleHome(
                                        title: homeDashboardController
                                            .homeTitleModel
                                            .value!
                                            .data!
                                            .eTitle!),
                                textAlign: TextAlign.left,
                                style: GoogleFonts.publicSans(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                              ),
                            ),
                            Image.asset(
                              "asset/logo/logo.png",
                              height: double.infinity,
                              width: 125,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 850,
                        width: mediaQueryWidth(context: context),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                        child: Obx(() => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                homeDashboardController.getSlidersResponseModel
                                            .value?.data ==
                                        null
                                    ? Container()
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 160,
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: CarouselSlider(
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            // Enable auto-play
                                            enlargeCenterPage: true,
                                            // Make the selected item larger
                                            aspectRatio: 16 /
                                                9, // Aspect ratio of the carousel items
                                            // You can customize various other options here
                                          ),
                                          items: /*imageList*/
                                              homeDashboardController
                                                  .getSlidersResponseModel
                                                  .value
                                                  ?.data
                                                  ?.map((imageUrl) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container(
                                                  padding: EdgeInsets.all(5),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  child: imageUrl.eImage == null
                                                      ? Container()
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Image.network(
                                                            imageUrl.eImage!,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                );
                                              },
                                            );
                                          }).toList(),
                                        )),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "We Are Offering",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.publicSans(
                                      textStyle: const TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                homeDashboardController
                                                .getCategoriesResponseModel
                                                .value
                                                ?.data ==
                                            null ||
                                        homeDashboardController
                                            .getCategoriesResponseModel
                                            .value!
                                            .data
                                            .isEmpty
                                    ? Container()
                                    : Container(
                                        width:
                                            mediaQueryWidth(context: context),
                                        height: 100,
                                        color: Colors.transparent,
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: homeDashboardController
                                                .getCategoriesResponseModel
                                                .value
                                                ?.data
                                                .length,
                                            itemBuilder: (cnx, index) {
                                              return index % 2 == 0
                                                  ? Container()
                                                  : Container(
                                                      height: double.infinity,
                                                      width: mediaQueryWidth(
                                                              context:
                                                                  context) /
                                                          4.5,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      decoration: const BoxDecoration(
                                                          color: Colors.yellow,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: homeDashboardController
                                                                    .getCategoriesResponseModel
                                                                    .value
                                                                    ?.data[
                                                                        index]
                                                                    .image ==
                                                                null
                                                            ? Image.asset(
                                                                "asset/other_image/image5.png",
                                                                fit:
                                                                    BoxFit.fill,
                                                              )
                                                            : Image.network(
                                                                homeDashboardController
                                                                    .getCategoriesResponseModel
                                                                    .value!
                                                                    .data[index]
                                                                    .image,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                      ),
                                                    );
                                            }),
                                      ),
                                homeDashboardController
                                                .getCategoriesResponseModel
                                                .value
                                                ?.data ==
                                            null ||
                                        homeDashboardController
                                            .getCategoriesResponseModel
                                            .value!
                                            .data
                                            .isEmpty
                                    ? Container()
                                    : Container(
                                        width:
                                            mediaQueryWidth(context: context),
                                        height: 100,
                                        color: Colors.transparent,
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: homeDashboardController
                                                .getCategoriesResponseModel
                                                .value
                                                ?.data
                                                .length,
                                            itemBuilder: (cnx, index) {
                                              return index % 2 == 1
                                                  ? Container()
                                                  : Container(
                                                      height: double.infinity,
                                                      width: mediaQueryWidth(
                                                              context:
                                                                  context) /
                                                          4.5,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      decoration: const BoxDecoration(
                                                          color: Colors.yellow,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: homeDashboardController
                                                                    .getCategoriesResponseModel
                                                                    .value
                                                                    ?.data[
                                                                        index]
                                                                    .image ==
                                                                null
                                                            ? Image.asset(
                                                                "asset/other_image/image5.png",
                                                                fit:
                                                                    BoxFit.fill,
                                                              )
                                                            : Image.network(
                                                                homeDashboardController
                                                                    .getCategoriesResponseModel
                                                                    .value!
                                                                    .data[index]
                                                                    .image,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                      ),
                                                    );
                                            }),
                                      ),
                                Text(
                                  "Customer Testimonials",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.publicSans(
                                      textStyle: const TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: mediaQueryWidth(context: context),
                                  height: 160,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Text(
                                            homeDashboardController
                                                    .getTestimonialResponseModel
                                                    .value
                                                    ?.data?[0]
                                                    .eComment ??
                                                loremIpsum,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.publicSans(
                                                textStyle: const TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    color: customeTesimonColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 115,
                                  width: mediaQueryWidth(context: context),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: mediaQueryWidth(
                                                context: context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          100))),
                                                  child: Image.asset(
                                                    "asset/other_image/image2.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const SizedBox(),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          100))),
                                                  child: Image.asset(
                                                    "asset/other_image/image2.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 65,
                                            width: mediaQueryWidth(
                                                context: context),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        height: 65,
                                        width:
                                            mediaQueryWidth(context: context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 65,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              100))),
                                              child: homeDashboardController
                                                          .getTestimonialResponseModel
                                                          .value
                                                          ?.data?[0]
                                                          .image ==
                                                      null
                                                  ? Image.asset(
                                                      "asset/other_image/image1.png",
                                                      fit: BoxFit.fill,
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: Image.network(
                                                        homeDashboardController
                                                            .getTestimonialResponseModel
                                                            .value!
                                                            .data![0]
                                                            .thumbImage!,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
