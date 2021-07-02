import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback onReset;
  const Result({Key? key, required this.score, required this.onReset})
      : super(key: key);

  String get resultPhrase {
    if (score <= 8)
      return "You are awesome and innocent";
    else if (score <= 12)
      return "Pretty likeable!";
    else if (score <= 16)
      return "You are ... strange?!";
    else
      return "You are so bad!";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          resultPhrase,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: TextButton(
              onPressed: onReset,
              child: Text(
                'RESTART',
                style: TextStyle(fontSize: 20),
              )),
        )
      ],
    );
  }
}
