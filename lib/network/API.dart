import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_list_app/network/movie.dart';

class API {
  static const API_KEY = '/k_6vcc5j8q';
  static const BASE_URL = 'https://imdb-api.com/en/API';

  static const POPULAR_LIST = '/MostPopularMovies';
  static const SEARCH_MOVIE = '/SearchMovie';

  Future<Movies> fetchPopular() async {
    final response =
        await http.get(Uri.parse(BASE_URL + POPULAR_LIST + API_KEY));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Movies> searchMovie(String text) async {
    final response = await http
        .get(Uri.parse(BASE_URL + SEARCH_MOVIE + API_KEY + '/' + text));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("if");
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
