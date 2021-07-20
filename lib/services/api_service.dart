import 'dart:convert';
import 'dart:io';

import 'package:flutter_task_2/models/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Movie>> filter() async {
    List<Movie> movies = [];
    var client = http.Client();

    var data = {
      'category': "movies",
      "language": "hindi",
      "genre": "all",
      "sort": "voting"
    };
    try {
      var response = await client.post(
          Uri.parse('https://hoblist.com/movieList'),
          headers: {"Content-Type": "application/json"},
          body: json.encode(data));

      var jsonString = response.body;
      
      List<dynamic> responseBody = json.decode(jsonString)['result'];
      responseBody.forEach((element) {
        movies.add(Movie.fromMap(element));
      });
      return movies;
    } catch (e) {
      print("errorFilter${e.toString()}");
      throw Exception(e);
    }
  }
}
