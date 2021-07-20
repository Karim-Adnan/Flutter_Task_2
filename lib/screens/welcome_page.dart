import 'package:flutter/material.dart';
import 'package:flutter_task_2/components/auth_button.dart';
import 'package:flutter_task_2/constants.dart';
import 'package:flutter_task_2/screens/home_page.dart';
import 'package:flutter_task_2/screens/login_page.dart';
import 'package:flutter_task_2/screens/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogin();
  }

  void checkIfAlreadyLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = (prefs.getBool('isLogin') ?? false);
    if (isLogin == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenWidth * 0.3,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(1, 1),
                        spreadRadius: 10,
                        blurRadius: screenWidth * 0.15,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Text(
                'Housy',
                style: GoogleFonts.openSans(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 5,
                ),
              ),
            ),
            SizedBox(
              height: screenWidth * 0.2,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: SignupPage(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: const AuthButton(
                    title: 'Sign Up',
                    buttonColor: kPrimaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: LoginPage(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: const AuthButton(
                    title: 'Login',
                    buttonColor: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
