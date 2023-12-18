import 'package:ebike/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeDetailsBox extends StatefulWidget {
  BikeDetailsBox(
      {super.key,
      required this.time,
      required this.distance,
      required this.bikeName,
      required this.date,
      required this.startLocation,
      required this.Destination});
  final int time;
  final double distance;
  final String bikeName;
  final String date;
  final String startLocation;
  final String Destination;
  @override
  _BikeDetailsBoxState createState() => _BikeDetailsBoxState();
}

class _BikeDetailsBoxState extends State<BikeDetailsBox> {
  void _toggleExpansion() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor.withOpacity(0.8),
            ),
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.bikeName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.date,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //(height: MediaQuery.of(context).size.width / 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: kAccentGreyBlueDark,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: kAccentGreyBlue,
                                  size: 10,
                                ),
                              ],
                            ),
                            CustomPaint(
                              size: Size(
                                  0.5, MediaQuery.of(context).size.height / 12),
                              painter: DashedLineVerticalPainter(),
                            ),
                            const Icon(
                              Icons.location_on,
                              color: kAccentGreyBlue,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 3),
                            const Text(
                              'Start Location',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              widget.startLocation,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 12),
                            Text(
                              'Your Destination',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              widget.Destination,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 3),
                            const Text(
                              "Time",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "${widget.time} mn",
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 13),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 3),
                            const Text(
                              "Distance",
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              "${widget.distance} km",
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    right: widget.bikeName == "INGA" ? -10 : -60,
                    bottom: 10,
                    child: SizedBox(
                      width: widget.bikeName == "INGA" ? 200 : 230,
                      child: Image.asset(
                        widget.bikeName == "INGA"
                            ? "assets/images/INGA_BIKE.png"
                            : "assets/images/LOKKA_BIKE.png",
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = kAccentGreyBlue
      ..strokeWidth = size.width * 2;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
