import 'package:flutter/material.dart';
import 'package:practica2_tap/models/popularDAO.dart';
import 'package:practica2_tap/network/api_movies.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({ Key? key }) : super(key: key);

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {

  ApiMovies? apiMovies;

  @override
  void initState(){
    super.initState();
    apiMovies = ApiMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: FutureBuilder(
        future: apiMovies?.getPopular(),
        builder: (BuildContext context, AsyncSnapshot<List<Results>?> snapshot){
          if(snapshot.hasError) {
            return Center(
              child: Text('Has error in this request'),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return _listPopular(snapshot.data);
          } else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _listPopular(List<Results>? movies){
    return ListView.builder(
      itemBuilder: (context, index){
        Results movie = movies![index];
        return Text(movie.title);
      },
      itemCount: movies!.length,
    );
  }
}