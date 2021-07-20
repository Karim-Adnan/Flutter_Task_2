import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_2/components/auth_button.dart';
import 'package:flutter_task_2/components/text_field_container.dart';
import 'package:flutter_task_2/constants.dart';
import 'package:flutter_task_2/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String profession = "";

  submit(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var email = await prefs.getString("email");
    if (email == emailController.text) {
      //email already used
    } else {
      await prefs.setString("name", nameController.text);
      await prefs.setString("email", emailController.text);
      await prefs.setString("password", passwordController.text);
      await prefs.setString("phone Number", phoneNumberController.text);
      await prefs.setString("profession", profession);
      await prefs.setBool("isLogin", true);
      Navigator.pop(context);
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

    String professionString = 'Profession';

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth * 0.1,
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
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.03,
                ),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: screenWidth * 0.075,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Text(
                'Please fill the details to sign up.',
                style: GoogleFonts.openSans(
                  color: Colors.grey.shade600,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: GoogleFonts.openSans(color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
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
              TextFieldContainer(
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: GoogleFonts.openSans(color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
              DropdownButton<String>(
                hint: Text(
                  professionString,
                  style: GoogleFonts.openSans(),
                ),
                items: <String>[
                  'Student',
                  'Teacher',
                  'Software Engineer',
                  'Designer',
                  'Developer',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    profession = value.toString();
                    professionString = profession;
                  });
                },
              ),
              InkWell(
                onTap: () => submit(context),
                child: const AuthButton(
                  title: "Sign Up",
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
