import 'package:flutter/material.dart';
import 'package:movie_list_app/network/movie.dart';

class MovieTile extends StatelessWidget {
  Movie movie;

  MovieTile(this.movie);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    if (movie.imDbRating.isEmpty) {
      movie.imDbRating = "0.0";
    }
    double tmp = double.parse(movie.imDbRating);
    if (double.parse(movie.imDbRating) > 7) {
      color = Colors.green;
    } else if (double.parse(movie.imDbRating) > 4) {
      color = Colors.blue;
    } else if (double.parse(movie.imDbRating) >= 0) {
      color = Colors.red;
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
            title: Row(
          children: [
            SizedBox(
                width: 100,
                child: ClipRRect(
                  child: Image.network(movie.image),
                  borderRadius: BorderRadius.circular(10),
                )),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie.year,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: 70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              movie.imDbRating +' IMDB',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
