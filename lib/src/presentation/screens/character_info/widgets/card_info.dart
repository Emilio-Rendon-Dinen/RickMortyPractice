import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String text1;
  final String text2;
  const CardInfo({
    super.key,
    this.text1 = '',
    this.text2 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1),
            Text(
              text2,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}
