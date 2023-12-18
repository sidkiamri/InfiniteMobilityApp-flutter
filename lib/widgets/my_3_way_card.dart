import 'package:ebike/utils/constants.dart';
import 'package:flutter/material.dart';

class RideInformationCard extends StatelessWidget {
  final String startingPoint;
  final String destination;
  final String date;
  final VoidCallback onTap;

  const RideInformationCard({
    required this.startingPoint,
    required this.destination,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .color!, // Specify the color you want
                BlendMode.srcIn,
              ),
              child: const Image(
                image: AssetImage('assets/images/cycling.png'),
              ),
            ), // Replace with your asset path

            SizedBox(width: 12),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis, // Truncate with ellipsis
                    maxLines: 1, // Limit to a single line
                    '$startingPoint - $destination',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        "Details",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: kAccentBlue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
