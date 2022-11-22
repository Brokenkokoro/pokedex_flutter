import 'package:flutter/material.dart';

import '../models/models.dart';

class PokeAbility extends StatelessWidget {
  const PokeAbility({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    int numbersOfAbilities = pokemon.abilities.length;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          const Text('Abilities'),
          const SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //const SizedBox(),

                  Text(
                    pokemon.abilities[0].ability.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: pokemon.abilities[0].isHidden!
                            ? null
                            : FontWeight.bold,
                        fontStyle: pokemon.abilities[0].isHidden!
                            ? FontStyle.italic
                            : null),
                  ),
                  if (numbersOfAbilities > 1)
                    Text(
                      pokemon.abilities[1].ability.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: pokemon.abilities[1].isHidden!
                              ? null
                              : FontWeight.bold,
                          fontStyle: pokemon.abilities[1].isHidden!
                              ? FontStyle.italic
                              : null),
                    ),

                  if (numbersOfAbilities > 2)
                    Text(
                      pokemon.abilities[2].ability.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: pokemon.abilities[2].isHidden!
                              ? null
                              : FontWeight.bold,
                          fontStyle: pokemon.abilities[2].isHidden!
                              ? FontStyle.italic
                              : null),
                    ),
                ],
              )),
        ],
      ),
    );
  }
}
