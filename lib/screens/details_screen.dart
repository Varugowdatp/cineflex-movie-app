import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Column(
        children: [
          Image.network(movie.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.summary,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
