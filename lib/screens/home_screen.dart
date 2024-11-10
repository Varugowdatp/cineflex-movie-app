import 'package:cineflix_movie_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_grid.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Add a label here
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),

            label: 'Search',
            // Add a label here
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onTap: () {
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              },
              decoration: InputDecoration(
                hintText: 'Search for a movie...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: movieProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : MovieGrid(movieProvider.movies),
          ),
        ],
      ),
    );
  }
}
