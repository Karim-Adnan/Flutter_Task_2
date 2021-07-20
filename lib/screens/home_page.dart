import 'package:flutter/material.dart';
import 'package:flutter_task_2/components/movie_tile.dart';
import 'package:flutter_task_2/constants.dart';
import 'package:flutter_task_2/models/movie.dart';
import 'package:flutter_task_2/screens/welcome_page.dart';
import 'package:flutter_task_2/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movieList = [];
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  bool isLoading = false;

  var name = "", email = "", password = "", profession = "", phone = "";

  @override
  void initState() {
    super.initState();
    getUserData();
    fetchMovieList();
  }

  fetchMovieList() async {
    setState(() {
      isLoading = true;
    });
    movieList = await ApiService.filter();
    print(movieList);
    setState(() {
      isLoading = false;
    });
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = (prefs.getString("name") ?? "");
      email = (prefs.getString("email") ?? "");
      password = (prefs.getString("password") ?? "");
      profession = (prefs.getString("profession") ?? "");
      phone = (prefs.getString("phone") ?? "");
    });
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLogin", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          'Movie List',
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => logout(context),
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) => MovieTile(
                moviePoster: movieList[index].poster,
                movieTitle: movieList[index].title,
                genre: movieList[index].genre,
                director: movieList[index].director[0],
                starring: movieList[index].stars[0],
                language: movieList[index].language,
                releaseDate: movieList[index].releasedDate.toString(),
                views: movieList[index].pageViews.toString(),
                votes: movieList[index].totalVoted.toString(),
              ),
            ),
    );
  }
}
