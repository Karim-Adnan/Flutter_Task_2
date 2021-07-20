import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  String genre;
  List director;
  List stars;
  String title;
  String language;
  int releasedDate;
  int pageViews;
  String poster;
  int totalVoted;
  Movie({
    required this.genre,
    required this.director,
    required this.stars,
    required this.title,
    required this.language,
    required this.releasedDate,
    required this.pageViews,
    required this.poster,
    required this.totalVoted,
  });

  Movie copyWith({
    String? genre,
    List? director,
    List? stars,
    String? title,
    String? language,
    int? releasedDate,
    int? pageViews,
    String? poster,
    int? totalVoted,
  }) {
    return Movie(
      genre: genre ?? this.genre,
      director: director ?? this.director,
      stars: stars ?? this.stars,
      title: title ?? this.title,
      language: language ?? this.language,
      releasedDate: releasedDate ?? this.releasedDate,
      pageViews: pageViews ?? this.pageViews,
      poster: poster ?? this.poster,
      totalVoted: totalVoted ?? this.totalVoted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genre': genre,
      'director': director,
      'stars': stars,
      'title': title,
      'language': language,
      'releasedDate': releasedDate,
      'pageViews': pageViews,
      'poster': poster,
      'totalVoted': totalVoted,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      genre: map['genre'],
      director: List.from(map['director']),
      stars: List.from(map['stars']),
      title: map['title'],
      language: map['language'],
      releasedDate: map['releasedDate'],
      pageViews: map['pageViews'],
      poster: map['poster'],
      totalVoted: map['totalVoted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(genre: $genre, director: $director, stars: $stars, title: $title, language: $language, releasedDate: $releasedDate, pageViews: $pageViews, poster: $poster, totalVoted: $totalVoted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Movie &&
      other.genre == genre &&
      listEquals(other.director, director) &&
      listEquals(other.stars, stars) &&
      other.title == title &&
      other.language == language &&
      other.releasedDate == releasedDate &&
      other.pageViews == pageViews &&
      other.poster == poster &&
      other.totalVoted == totalVoted;
  }

  @override
  int get hashCode {
    return genre.hashCode ^
      director.hashCode ^
      stars.hashCode ^
      title.hashCode ^
      language.hashCode ^
      releasedDate.hashCode ^
      pageViews.hashCode ^
      poster.hashCode ^
      totalVoted.hashCode;
  }
}
