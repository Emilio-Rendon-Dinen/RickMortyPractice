part of '../characters_screen.dart';

class _CharacterWidget extends StatelessWidget {
  final Character character;

  const _CharacterWidget({
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.black.withOpacity(0.4),
    );
  }
}
