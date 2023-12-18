import 'package:ebike/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/widget.dart';
import 'my_bike_detail_tile.dart';
import 'my_bike_sized_card.dart';

class BikeDetails extends StatefulWidget {
  final Bike selectedBike;

  const BikeDetails({Key? key, required this.selectedBike}) : super(key: key);

  @override
  State<BikeDetails> createState() => _BikeDetailsState();
}

class _BikeDetailsState extends State<BikeDetails> {
  void _toggleExpansion() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor.withOpacity(0.77),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _toggleExpansion,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Image.asset(widget.selectedBike.image,
                                  height:
                                      MediaQuery.sizeOf(context).height / 6.5),
                            ),
                            Visibility(
                                child: Text(
                                  'Available in two sizes : ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                visible: widget.selectedBike.name != 'INGA'),
                            const SizedBox(height: 10),
                            Visibility(
                                child: const BikeSizeCard(
                                  size1: '1 M3',
                                  length1: 'Length: 106 cm',
                                  width1: 'Width: 100 cm',
                                  height1: 'Height: 100 cm',
                                  size2: '1.5 M3',
                                  length2: 'Length: 126 cm',
                                  width2: 'Width: 100 cm',
                                  height2: 'Height: 120 cm',
                                ),
                                visible: widget.selectedBike.name != 'INGA'),
                            const SizedBox(height: 15),
                            const Text(
                              'General informations : ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 2.0,
                        children: [
                          BikeDetailTile(
                            backgroundColor: kAccentRedPale,
                            icon: Icons.solar_power,
                            title: 'Solar Cells:',
                            value: widget.selectedBike.name == 'INGA'
                                ? '160 Wp'
                                : '550 Wp',
                          ),
                          BikeDetailTile(
                            backgroundColor: kAccentGreyBlue,
                            icon: Icons.line_weight,
                            title: 'Max Load:',
                            value: widget.selectedBike.name == 'INGA'
                                ? '250 kg'
                                : '350 kg',
                          ),
                          BikeDetailTile(
                            backgroundColor: kAccentRedLight,
                            icon: Icons.bolt,
                            title: 'Motor Output:',
                            value: '25km/h',
                          ),
                          BikeDetailTile(
                            backgroundColor: kAccentGreyBlueDark,
                            icon: Icons.mode_of_travel,
                            title: 'Range:',
                            value: '60 km',
                          ),
                          BikeDetailTile(
                            backgroundColor: kAccentLightGreen,
                            icon: Icons.speed,
                            title: 'Top Speed:',
                            value: '25 km/h',
                          ),
                          BikeDetailTile(
                            backgroundColor: kAccentBluePale,
                            icon: Icons.settings,
                            title: 'Gearbox:',
                            value: '25km/h',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
