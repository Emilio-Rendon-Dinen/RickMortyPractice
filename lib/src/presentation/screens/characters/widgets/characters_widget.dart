part of '../characters_screen.dart';

class _CharactersWidget extends StatelessWidget {
  const _CharactersWidget();

  @override
  Widget build(BuildContext context) {
    final SnapshotData<List<Character>> snapshotCharacters = context.select<CharactersNotifier, SnapshotData<List<Character>>>((notifier) => notifier.snapshotCharacters);

    if (snapshotCharacters.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: snapshotCharacters.data.length,
      itemBuilder: (context, index) {
        return _CharacterWidget(
          character: snapshotCharacters.data[index],
        );
      },
    );
  }
}
