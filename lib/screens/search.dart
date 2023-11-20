import 'package:flutter/material.dart';
import 'package:searchlist/model/movie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List<MovieModel> movies = [
    MovieModel(
        "They Shall Not Grow Old",
        2018,
        "https://m.media-amazon.com/images/M/MV5BZWI3ZThmYzUtNDJhOC00ZWY4LThiNmMtZDgxNjE3Yzk4NDU1XkEyXkFqcGdeQXVyNTk5Nzg1NjQ@._V1_SX300.jpg",
        8.3),
    MovieModel(
        "Midnight Family",
        2019,
        "https://m.media-amazon.com/images/M/MV5BMGYyZTk5MjYtNGY2ZS00NzRhLTgwMWMtZjhmMmQ4OGFkNTNiXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
        7.8),
    MovieModel(
        "Pain & Gain",
        2013,
        "https://m.media-amazon.com/images/M/MV5BMTU0NDE5NTU0OV5BMl5BanBnXkFtZTcwMzI1OTMzOQ@@._V1_SX300.jpg",
        6.4),
    MovieModel(
        "The Irishman",
        2019,
        "https://m.media-amazon.com/images/M/MV5BMGUyM2ZiZmUtMWY0OC00NTQ4LThkOGUtNjY2NjkzMDJiMWMwXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SX300.jpg",
        8.2),
    MovieModel(
        "Once Upon a Time... in Hollywood",
        2019,
        "https://m.media-amazon.com/images/M/MV5BOTg4ZTNkZmUtMzNlZi00YmFjLTk1MmUtNWQwNTM0YjcyNTNkXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SX300.jpg",
        7.9),
    MovieModel(
        "Marriage Story",
        2019,
        "https://m.media-amazon.com/images/M/MV5BZGVmY2RjNDgtMTc3Yy00YmY0LTgwODItYzBjNWJhNTRlYjdkXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_SX300.jpg",
        9.0),
    MovieModel(
        "Little Women",
        1994,
        "https://m.media-amazon.com/images/M/MV5BMzFiYWQxYzgtOThmYi00ZmIwLWFlZWMtMzk2NTI2YTYzMjkyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
        7.3),
    MovieModel(
        "Parasite",
        2019,
        "https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg",
        8.1),
    MovieModel(
        "Dolemite Is My Name",
        2019,
        "https://m.media-amazon.com/images/M/MV5BMzFiYWQxYzgtOThmYi00ZmIwLWFlZWMtMzk2NTI2YTYzMjkyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
        7.5)
  ];

  List<MovieModel> displayMovies = List.from(movies);

  void updateList(String value) {
    setState(() {
      displayMovies = movies
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 36, left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search for a Movie",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.blueGrey.shade700,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none),
                    hintText: "eg. The Avengers",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: displayMovies.length == 0
                    ? Center(
                        child: Text(
                          "Now result found",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: displayMovies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              contentPadding: EdgeInsets.all(8.0),
                              title: Text(
                                displayMovies[index].title!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              subtitle: Text(
                                "${displayMovies[index].release_year!}",
                                style: TextStyle(color: Colors.black87),
                              ),
                              trailing: Text(
                                "${displayMovies[index].rating!}",
                                style: TextStyle(
                                    color: Colors.amber.shade900,
                                    fontSize: 16.0),
                              ),
                              leading: Image.network(
                                  displayMovies[index].poster_url!));
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
