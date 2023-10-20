import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rick_morty_practice/src/domain/models/character.dart';
import 'package:rick_morty_practice/src/domain/models/episode.dart';
import 'package:rick_morty_practice/src/presentation/models/snapshot_data.dart';
import 'package:rick_morty_practice/src/presentation/screens/character_info/character_info_notifier.dart';
import 'package:rick_morty_practice/src/presentation/screens/character_info/widgets/card_info.dart';

class CharacterInfoScreen extends StatelessWidget {
  final Character character;

  const CharacterInfoScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    CharacterInfoNotifier notifier = context.read<CharacterInfoNotifier>();
    SnapshotData<Episode?> snapShotEpisode = context.select<CharacterInfoNotifier, SnapshotData<Episode?>>((notifier) => notifier.snapShotDataEpisode);

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
                CardInfo(text1: 'Estatus:', text2: character.status),
                CardInfo(text1: 'Especie:', text2: character.species),
                CardInfo(text1: 'Visto en:', text2: character.location!.name),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Episodios', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: character.episodes!.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    InkWell(
                      child: Text(character.episodes![index]),
                      onTap: () {
                        notifier.fetchEpisode(character.episodes![index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
