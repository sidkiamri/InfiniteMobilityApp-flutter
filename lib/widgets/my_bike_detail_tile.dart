import 'package:flutter/material.dart';

class BikeDetailTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color backgroundColor;

  BikeDetailTile(
      {required this.icon,
      required this.title,
      required this.value,
      required this.backgroundColor});

  @override
  State<BikeDetailTile> createState() => _BikeDetailTileState();
}

class _BikeDetailTileState extends State<BikeDetailTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.backgroundColor,
      elevation: 2,
      child: ListTile(
        leading: Icon(
          widget.icon,

          color: Colors.black, // Icon color based on theme in other modes
        ),
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black),
        ),
        subtitle: Text(
          widget.value,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
