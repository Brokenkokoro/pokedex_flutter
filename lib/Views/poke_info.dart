import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/widgets.dart';

class PokeInfo extends StatelessWidget {
  const PokeInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemon;
    String? pokeimage = (pokemon.sprites.other?.officialArtwork?.frontDefault ??
            pokemon.sprites.other?.home?.frontDefault) ??
        'https://rmc.co.ma/wp-content/themes/consultix/images/no-image-found-360x260.png';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTypePoke(pokemon.types[0].type.name),
        title: Text(pokemon.name),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PokeAbility(pokemon: pokemon),
                  PokeAbility(pokemon: pokemon),
                  PokeAbility(pokemon: pokemon),
                  PokeAbility(pokemon: pokemon),
                  PokeAbility(pokemon: pokemon),
                  PokeAbility(pokemon: pokemon),
                  PokeAbility(pokemon: pokemon),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
