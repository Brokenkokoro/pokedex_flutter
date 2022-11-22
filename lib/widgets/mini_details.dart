import 'package:flutter/material.dart';

import '../models/models.dart';

class MiniDetails extends StatelessWidget {
  const MiniDetails({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text('#${pokemon.id}'),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                pokemon.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: colorTypePoke(pokemon.types[0].type.name),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  pokemon.types[0].type.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (pokemon.types.length > 1)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: colorTypePoke(pokemon.types[1].type.name),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    pokemon.types[1].type.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            else
              Expanded(child: Container()),
          ],
        )
      ],
    );
  }
}

Color colorTypePoke(nameType) {
  Color colorType;
  switch (nameType) {
    case 'bug':
      colorType = const Color.fromARGB(255, 152, 210, 51);
      break;
    case 'dark':
      colorType = const Color.fromARGB(255, 2, 26, 36);
      break;
    case 'dragon':
      colorType = const Color.fromARGB(255, 59, 32, 148);
      break;
    case 'electric':
      colorType = const Color.fromARGB(255, 236, 216, 1);
      break;
    case 'fairy':
      colorType = const Color.fromARGB(255, 204, 48, 170);
      break;
    case 'fire':
      colorType = const Color.fromARGB(255, 214, 33, 33);
      break;
    case 'flying':
      colorType = const Color.fromARGB(255, 147, 235, 243);
      break;
    case 'ghost':
      colorType = const Color.fromARGB(255, 94, 11, 127);
      break;
    case 'grass':
      colorType = const Color.fromARGB(255, 27, 172, 17);
      break;
    case 'ground':
      colorType = const Color.fromARGB(255, 218, 175, 35);
      break;
    case 'ice':
      colorType = const Color.fromARGB(255, 172, 242, 237);
      break;
    case 'normal':
      colorType = const Color.fromARGB(255, 209, 203, 179);
      break;
    case 'poison':
      colorType = const Color.fromARGB(255, 139, 28, 241);
      break;
    case 'psychic':
      colorType = const Color.fromARGB(255, 215, 100, 200);
      break;
    case 'rock':
      colorType = const Color.fromARGB(255, 158, 103, 9);
      break;
    case 'steel':
      colorType = const Color.fromARGB(255, 106, 106, 106);
      break;
    case 'water':
      colorType = const Color.fromARGB(255, 37, 85, 228);
      break;
    case 'fighting':
      colorType = const Color.fromARGB(255, 207, 85, 55);
      break;
    default:
      colorType = Colors.white;
  }

  return colorType;
}
