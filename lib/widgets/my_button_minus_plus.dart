import 'package:ebike/utils/constants.dart';
import 'package:flutter/material.dart';

class PlusMinusButtons extends StatefulWidget {
  @override
  _PlusMinusButtonsState createState() => _PlusMinusButtonsState();
}

class _PlusMinusButtonsState extends State<PlusMinusButtons> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Assistance',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _decrement,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                backgroundColor: kAccentRed,
              ),
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 45),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(width: 45),
            ElevatedButton(
              onPressed: _increment,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                backgroundColor: kAccentGreen,
              ),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
