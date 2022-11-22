import 'package:flutter/material.dart';
import 'package:pokedex/provider/pokes_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _controller;
  bool puntero = false;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        setState(() {
          if (_controller.offset >= 400) {
            puntero = true;
          } else {
            puntero = false;
          }
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pokesProvider = Provider.of<PokesProvider>(context);

    int grid = (size.width / 180).truncate();

    return Scaffold(
      floatingActionButton: (puntero)
          ? IconButton(
              icon: const Icon(Icons.arrow_circle_up_outlined),
              onPressed: () => _controller.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate),
            )
          : null,
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: grid, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemCount: pokesProvider.pokemones.length,
          controller: _controller,
          itemBuilder: (context, index) {
            _controller.addListener;
            return PokeContainers(
                pokemones: pokesProvider.pokemones, index: index);
          },
        ),
      ),
    );
  }
}
