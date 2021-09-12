import 'package:flutter/material.dart';
import 'package:movie_list_app/network/API.dart';
import 'package:movie_list_app/network/movie.dart';
import 'package:movie_list_app/util/movie_list.dart';
import 'package:movie_list_app/util/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  API api;
  Movies data;

  @override
  void initState() {
    super.initState();
    api = API();
    _fetchPopularMovies();
  }

  _fetchPopularMovies() async {
    final movies = await api.fetchPopular();
    print(movies);
    setState(() {
      data = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SearchBar(),
          this.data != null
              ? MovieList(
                  movies: this.data.items,
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
