import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_grid.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';

  final TextEditingController _controller = TextEditingController();

  void _searchMovies(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.searchMovies(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter movie name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _searchMovies(context),
            ),
          ),
          Expanded(
            child: Consumer<MovieProvider>(
              builder: (ctx, movieProvider, _) {
                return movieProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : MovieGrid(movieProvider.searchedMovies);
              },
            ),
          ),
        ],
      ),
    );
  }
}
