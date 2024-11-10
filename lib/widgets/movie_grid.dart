import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_item.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;

  MovieGrid(this.movies);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65, // Adjusted aspect ratio for better fit
      ),
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return MovieItem(movies[index]);
      },
    );
  }
}
