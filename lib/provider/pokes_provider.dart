import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokedex.dart';

import '../models/models.dart';

class PokesProvider extends ChangeNotifier {
  List<Pokemon> pokemones = [];
  List<Result>? maxPokes;

  PokesProvider() {
    getData();
  }

  Future<List<Result>?> getPokedex() async {
    final url =
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final pokedex = Pokedex.fromJson(response.body);
      maxPokes = pokedex.results;

      return maxPokes;
    }
    return null;
  }

  getData() async {
    maxPokes = await getPokedex();
    if (maxPokes != null) {
      for (var element in maxPokes!) {
        await getPokemones(element.url);
        //print(element);
      }
    }
  }

  getPokemones(String index) async {
    final url = Uri.parse(index);
    final response = await http.get(url);
    final pokemon = Pokemon.fromJson(response.body);
    if (pokemon.id < 5000) {
      pokemones.add(pokemon);
    }

    //print(response.body);

    notifyListeners();
  }
}
