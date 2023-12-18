import 'package:flutter/material.dart';

class BikeSizeCard extends StatefulWidget {
  final String size1;
  final String length1;
  final String width1;
  final String height1;
  final String size2;
  final String length2;
  final String width2;
  final String height2;

  const BikeSizeCard({
    required this.size1,
    required this.length1,
    required this.width1,
    required this.height1,
    required this.size2,
    required this.length2,
    required this.width2,
    required this.height2,
  });

  @override
  State<BikeSizeCard> createState() => _BikeSizeCardState();
}

class _BikeSizeCardState extends State<BikeSizeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.77),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.size1,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(widget.length1),
                  const SizedBox(height: 5),
                  Text(widget.width1),
                  const SizedBox(height: 5),
                  Text(widget.height1),
                ],
              ),
            ),
            Container(
              width: 1,
              color: Colors.grey,
              height: 100, // Adjust the height of the vertical separator
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.size2,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(widget.length2),
                  const SizedBox(height: 5),
                  Text(widget.width2),
                  const SizedBox(height: 5),
                  Text(widget.height2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
