import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/details_screen.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movie: movie),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container for the image
            Container(
              height: 200, // Fixed height for the image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(movie.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Padding for the text section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie title with overflow handling
                  Text(
                    movie.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                    maxLines: 1, // Limit to one line
                  ),
                  SizedBox(height: 5), // Spacing between title and summary
                  // Movie summary with overflow handling
                  Text(
                    movie.summary,
                    maxLines: 2, // Limit to three lines
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
