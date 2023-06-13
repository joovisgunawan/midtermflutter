// import 'dart:async';
import 'dart:convert';

// import 'package:barterit/mainscreen/landingscreen.dart';
// import 'package:barterit/mainscreen/notificationscreen.dart';
import 'package:barteritcopy/mainscreen/controllerscreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../phpconfig.dart';
import '../object/user.dart';
import 'package:http/http.dart' as http;

import 'introscreen/getstartedscreen.dart';

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_splash_screen/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAndLogin();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 150,
      duration: 4000,
      splash: Image.asset('assets/images/logo.png'),
      nextScreen: const GetStarted(),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
      backgroundColor: const Color(0xff000022),
    );
  }

  checkAndLogin() async {
    // print('object');
    SharedPreferences preference = await SharedPreferences.getInstance();
    String email = (preference.getString('email')) ?? '';
    String password = (preference.getString('password')) ?? '';
    bool ischeck = (preference.getBool('checkbox')) ?? false;

    late User user;
    if (ischeck) {
      http.post(
        Uri.parse("${PhpConfig().SERVER}/barterlt/php/signin.php"),
        body: {
          "user_email": email,
          "user_password": password,
        },
      ).then((response) {
        print(response.body);
        print(email);
        print(password);
        if (response.statusCode == 200) {
          var jsondata = jsonDecode(response.body);
          if (jsondata['status'] == 'success') {
            user = User.fromJson(jsondata['data']);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ControllerScreen(user: user),
                ));
          }
        }
      });
    }
  }
}
