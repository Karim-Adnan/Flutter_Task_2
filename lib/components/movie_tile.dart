import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTile extends StatelessWidget {
  final String moviePoster;
  final String movieTitle;
  final String genre;
  final String director;
  final String starring;
  final String language;
  final String releaseDate;
  final String views;
  final String votes;

  const MovieTile(
      {Key? key,
      required this.moviePoster,
      required this.movieTitle,
      required this.genre,
      required this.director,
      required this.starring,
      required this.language,
      required this.releaseDate,
      required this.views,
      required this.votes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.03,
        horizontal: screenWidth * 0.05,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(3, 3),
              spreadRadius: 0.5,
              blurRadius: screenWidth * 0.03,
            ),
          ],
        ),
        child: Container(
          color: Colors.white,
          width: screenWidth * 0.9,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        size: screenWidth * 0.13,
                      ),
                      Text(
                        '1',
                        style:
                            GoogleFonts.openSans(fontSize: screenWidth * 0.07),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: screenWidth * 0.13,
                      ),
                      Text(
                        'Votes',
                        style: GoogleFonts.openSans(
                          fontSize: screenWidth * 0.04,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Container(
                      height: screenWidth * 0.38,
                      width: screenWidth * 0.22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.03,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(1.5, 1.5),
                            spreadRadius: 1,
                            blurRadius: screenWidth * 0.01,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            moviePoster,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.495,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: screenWidth * 0.02,
                          ),
                          child: Text(
                            movieTitle,
                            style: GoogleFonts.openSans(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.005,
                          ),
                          child: Text(
                            'Genre: $genre',
                            style: GoogleFonts.openSans(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.005,
                          ),
                          child: Text(
                            'Director: $director',
                            style: GoogleFonts.openSans(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.005,
                          ),
                          child: Text(
                            'Starring: $starring',
                            style: GoogleFonts.openSans(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.005,
                          ),
                          child: Text(
                            'Mins | $language | $releaseDate',
                            style: GoogleFonts.openSans(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.005,
                          ),
                          child: Text(
                            '$views views | Voted by $votes People',
                            style: GoogleFonts.openSans(
                              color: Colors.cyan,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenWidth * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenWidth * 0.01,
                ),
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      screenWidth * 0.01,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.015),
                      child: Text(
                        'Watch Trailer',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
