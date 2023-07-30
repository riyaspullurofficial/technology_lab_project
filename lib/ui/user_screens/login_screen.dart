import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/login_controller.dart';
import '../../utils/config/spacing.dart';
import '../../utils/config/text_field_decoration.dart';
import '../../utils/widgets/button.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Contact number',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                          letterSpacing: 1.2,
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    )),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  onChanged: (userNumber) {
                    loginController.mobileNumber = userNumber.trim();
                  },
                  decoration:
                      textFieldDecoration(labelText: 'Enter your phone'),
                ),
                textFieldHeightSpacing,
                /*   TextFormField(
                  onChanged: (password) {},
                  decoration: textFieldDecoration(labelText: 'Password'),
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 30),
                      /*     child: Text(
                        'Forgot Password',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                letterSpacing: 1.2,
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ),*/
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      loginController.generateOTP(callback: (){
                        Get.to(OtpScreen());
                      });

                    },
                    child: loginButton(
                        buttonText:
                            'Generate') /*signButton(buttonName: 'Sign In', context: context)*/),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you have\'t already an account? ',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: textFieldHint,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignupScreen());
                      },
                      child: Text(
                        'Signup',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: black,
                                fontSize: 13,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),*/
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
