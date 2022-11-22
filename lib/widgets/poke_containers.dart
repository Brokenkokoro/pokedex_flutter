import 'package:flutter/material.dart';
import 'package:pokedex/widgets/mini_details.dart';

import '../models/models.dart';

class PokeContainers extends StatelessWidget {
  final int index;
  final List<Pokemon> pokemones;

  const PokeContainers({
    Key? key,
    required this.index,
    required this.pokemones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? pokeimage = (pokemones[index]
                .sprites
                .other
                ?.officialArtwork
                ?.frontDefault ??
            pokemones[index].sprites.other?.home?.frontDefault) ??
        'https://rmc.co.ma/wp-content/themes/consultix/images/no-image-found-360x260.png';

    final pokemon = pokemones[index];

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'pokeinfo', arguments: pokemon),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.all(5),
        //margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: pokemon.id,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(pokeimage.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            MiniDetails(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
