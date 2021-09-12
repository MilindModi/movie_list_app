import 'package:flutter/material.dart';
import 'package:movie_list_app/component/movie_tile.dart';
import 'package:movie_list_app/network/movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieTile(movie);
        },
      ),
    );
  }
}
