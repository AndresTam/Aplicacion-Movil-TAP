import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practica2_tap/models/popularDAO.dart';

class ApiMovies{
  var url = Uri.parse("api.themoviedb.org/3/movie/popular?api_key=0089e3aaa6276af8f52bdfdb39021dae&language=es-MX&page=1");

  Future<List<Results>?> getPopular() async {
    final response = await http.get(url);
    if(response.statusCode == 200){
      try{
        var movies = convert.jsonDecode(response.body)['results'] as List;
        List<Results> listMovies = movies.map((movie) => Results.fromMap(movie)).toList();
        return listMovies;
      } catch(e, r){
        return null;
      }
    } else{
      return null;
    }
  }
}