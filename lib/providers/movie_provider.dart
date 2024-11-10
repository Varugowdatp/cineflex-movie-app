import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> _searchedMovies = [];
  bool _isLoading = true;

  MovieProvider() {
    fetchMovies();
  }

  List<Movie> get movies => _movies;
  List<Movie> get searchedMovies => _searchedMovies;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    final response =
        await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    final List<dynamic> data = json.decode(response.body);

    _movies = data.map((item) {
      return Movie(
        title: item['show']['name'],
        summary: item['show']['summary'] ?? 'No summary available',
        imageUrl: item['show']['image'] != null
            ? item['show']['image']['medium']
            : '',
      );
    }).toList();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();

    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    final List<dynamic> data = json.decode(response.body);

    _searchedMovies = data.map((item) {
      return Movie(
        title: item['show']['name'],
        summary: item['show']['summary'] ?? 'No summary available',
        imageUrl: item['show']['image'] != null
            ? item['show']['image']['medium']
            : '',
      );
    }).toList();

    _isLoading = false;
    notifyListeners();
  }
}
