part of '../characters_screen.dart';

class _CharactersWidget extends StatefulWidget {
  final void Function(Character character)? onTap;
  const _CharactersWidget({this.onTap});

  @override
  State<_CharactersWidget> createState() => _CharactersWidgetState();
}

class _CharactersWidgetState extends State<_CharactersWidget> {
  @override
  Widget build(BuildContext context) {
    SnapshotData<List<Character>> snapshotCharacters = context.select<CharactersNotifier, SnapshotData<List<Character>>>((notifier) => notifier.snapshotCharacters);
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<CharactersNotifier>().increment();
      }
    });

    if (snapshotCharacters.isLoading && snapshotCharacters.data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .87,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: snapshotCharacters.isLoading ? snapshotCharacters.data.length + 2 : snapshotCharacters.data.length,
      itemBuilder: (BuildContext context, int index) {
        if (index < snapshotCharacters.data.length) {
          final character = snapshotCharacters.data[index];
          return GestureDetector(
            onTap: () => widget.onTap!(character),
            child: Card(
              child: Column(
                children: [
                  Hero(
                    tag: character.id,
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/images/portalgif.gif'),
                      image: NetworkImage(character.image),
                    ),
                  ),
                  Text(
                    character.name,
                    style: const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
