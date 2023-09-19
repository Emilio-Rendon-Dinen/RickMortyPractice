import 'package:flutter/material.dart';
import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/presentation/screens/character_info/widgets/card_info.dart';

class CharacterInfoScreen extends StatelessWidget {
  final Character character;

  const CharacterInfoScreen({
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(character.name),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: size.height * 0.35,
            width: double.infinity,
            child: Hero(
              tag: character.id,
              child: Image.network(
                character.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: size.height * 0.14,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardInfo(text1: "Estatus:", text2: character.status),
                CardInfo(text1: "Especie:", text2: character.species),
                CardInfo(text1: "Visto en:", text2: character.location!.name),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Episodios', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 12),
          // Expanded(child: EpisodesList(size: size, character: character))
        ]),
      ),
    );
  }
}
