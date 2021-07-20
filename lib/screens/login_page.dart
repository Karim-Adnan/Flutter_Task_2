import 'package:flutter/material.dart';
import 'package:flutter_task_2/components/auth_button.dart';
import 'package:flutter_task_2/components/text_field_container.dart';
import 'package:flutter_task_2/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_task_2/constants.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String profession = "";

  submit(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = await prefs.getString("email");
    var password = await prefs.getString("password");
    if (email == emailController.text && password == passwordController.text) {
      await prefs.setBool("isLogin", true);
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      // error message: email or password incorrect
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth * 0.2,
              ),
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
              SizedBox(
                height: screenWidth * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.01,
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: screenWidth * 0.075,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Text(
                'Please Login to your account.',
                style: GoogleFonts.openSans(
                  color: Colors.grey.shade600,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: screenWidth * 0.1,
              ),
              TextFieldContainer(
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.openSans(color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.openSans(color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: GoogleFonts.openSans(
                      color: Colors.grey.shade700,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.04,
              ),
              InkWell(
                onTap: () => submit(context),
                child: const AuthButton(
                  title: "Login",
                  buttonColor: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
