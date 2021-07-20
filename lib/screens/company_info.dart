import 'package:flutter/material.dart';
import 'package:flutter_task_2/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop;
          },
        ),
        title: Text(
          'Company Info',
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenWidth * 0.1,
            ),
            Row(
              children: [
                Text(
                  'Company: ',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),Text(
                  'Housy',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Address: ',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),Text(
                  'Pune, India',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Phone: ',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ), Text(
                  '9898989809',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Email: ',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),Text(
                  'kaif.adnan05@gmail.com',
                  style: GoogleFonts.openSans(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
