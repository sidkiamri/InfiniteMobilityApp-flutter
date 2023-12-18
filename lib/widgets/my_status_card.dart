import 'package:ebike/utils/constants.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final bool isGood;
  final String errorDescription;
  final VoidCallback onTap;

  const StatusCard({
    Key? key,
    required this.title,
    required this.isGood,
    required this.errorDescription,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Details",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: kAccentBlue),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isGood ? Icons.check_circle_outline : Icons.error_outline,
                  color: isGood ? kAccentGreen : kAccentRed,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  errorDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
