import 'package:ebike/utils/constants.dart';
import 'package:flutter/material.dart';

class BikeCard extends StatefulWidget {
  final String bikeImage;
  final String bikename;
  final String lastsynced;
  final VoidCallback onTap;
  final bool isAssociated;

  const BikeCard({
    Key? key,
    required this.bikeImage,
    required this.bikename,
    required this.lastsynced,
    required this.onTap,
    required this.isAssociated,
  }) : super(key: key);

  @override
  State<BikeCard> createState() => _BikeCardState();
}

class _BikeCardState extends State<BikeCard> {
  @override
  Widget build(BuildContext context) {
    Color containerColor = widget.isAssociated ? kAccentGreen : kAccentBlue;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              height: 75,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: kAccentGreyBlue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset(
                widget.bikeImage,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
                width: 20), // Add some spacing between the image and text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.bikename,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.lastsynced,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Handle the association action here
                  },
                  child: Container(
                    width: 105,
                    height: 25,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Icon(
                            widget.isAssociated ? Icons.link : Icons.link_off,
                            size: 15,
                            color: containerColor,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          widget.isAssociated ? 'Associated' : 'Associate',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
