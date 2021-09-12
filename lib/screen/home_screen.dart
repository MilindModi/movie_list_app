import 'package:flutter/material.dart';
import 'package:movie_list_app/component/error_message.dart';
import 'package:movie_list_app/component/movie_list.dart';
import 'package:movie_list_app/component/search_bar.dart';
import 'package:movie_list_app/network/API.dart';
import 'package:movie_list_app/network/movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  API api;
  List<Movie> data;

  List<Movie> _dataToDisplay;

  @override
  void initState() {
    super.initState();
    api = API();
    _fetchPopularMovies();
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
          SearchBar(_searchMovies),
          if( this._dataToDisplay != null && this._dataToDisplay.length == 0) ErrorMessage('No movies found') ,
          this._dataToDisplay != null
              ? MovieList(
                  movies: this._dataToDisplay,
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }

  _fetchPopularMovies() async {
    final movies = await api.fetchPopular();
    setState(() {
      data = movies.items;
      _dataToDisplay = data;
    });
  }

  _searchMovies(String title) async {
    if (title.isNotEmpty) {
      setState(() {
        _dataToDisplay = this
            .data
            .where((movie) =>
                movie.title.toLowerCase().contains(title.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _dataToDisplay = this.data;
      });
    }
  }
}
