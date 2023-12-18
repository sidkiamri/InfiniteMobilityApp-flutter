import 'package:ebike/utils/constants.dart';
import 'package:ebike/utils/data_provider.dart';
import 'package:ebike/widgets/my_bike_details.dart';
import 'package:ebike/widgets/my_bikes_card.dart';
import 'package:flutter/material.dart';
import '../widgets/my_bluetooth_lock.dart';
import '../widgets/my_recent_rides.dart';
import '../widgets/widget.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  final List<Map<String, String>> rideInfoList = DataProvider.rideInfoList;
  final List<Bike> bikes = [
    Bike(name: 'LØKKA', image: "assets/images/LOKKA_BIKE.png"),
    Bike(name: 'INGA', image: "assets/images/INGA_BIKE.png"),
    // Add more bikes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bike_name",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "INFINITE",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: kAccentRedPale),
                  ),
                ],
              ),
              Text(
                "Last synced 1min ago",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          reverse: false,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: BatteryStatusContainer(
                          batteryStatus: BatteryStatus(
                              batteryLevel: 18,
                              batteryTimeLeft: "2h:50mn",
                              distanceLeft: 30,
                              isCharging: false),
                        ),
                        onTap: () {
                          showBikeDetailsDialog();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomLockSwitchWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatusCard(
                              title: "Bike status",
                              errorDescription: "No warnings ready to ride",
                              isGood: false,
                              onTap: () {
                                _showWarningsBottomSheet(context);
                              }),
                          const SizedBox(height: 15),
                          Stack(alignment: Alignment.center, children: [
                            SizedBox(
                              height: 140,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: rideInfoList.length,
                                pageSnapping: true,
                                controller: PageController(viewportFraction: 1),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: BikeCard(
                                      bikeImage: 'assets/images/bike_image.png',
                                      bikename: 'Mountain Bike',
                                      lastsynced: 'Last Synced: 2 hours ago',
                                      onTap: () {
                                        // Add your onTap functionality here
                                        // For example, you can navigate to a new screen or perform an action
                                      },
                                      isAssociated: false,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              right: 10, // Adjust the position as needed
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                size: 17,
                              ),
                              // iOS arrow icon for forward
                            ),
                          ]),
                          Text(
                            "Your recent rides",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 5),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 90,
                                child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: rideInfoList.length,
                                  pageSnapping: true,
                                  controller:
                                      PageController(viewportFraction: 0.8),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: RideInformationCard(
                                        startingPoint: rideInfoList[index]
                                                ['startLocation'] ??
                                            "Loading...",
                                        destination: rideInfoList[index]
                                                ['endLocation'] ??
                                            "Loading...",
                                        date: rideInfoList[index]['date'] ??
                                            "Loading...",
                                        onTap: () {
                                          showRideDetailsDialog(
                                            rideInfoList[index]["endLocation"]!,
                                            rideInfoList[index]["bikeName"]!,
                                            rideInfoList[index]["date"]!,
                                            rideInfoList[index]
                                                ["startLocation"]!,
                                            double.parse(rideInfoList[index]
                                                ["distance"]!),
                                            int.parse(
                                                rideInfoList[index]["time"]!),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                right: 5, // Adjust the position as needed
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                  size: 17,
                                ),
                                // iOS arrow icon for forward
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _showWarningsBottomSheet(BuildContext context) {
    List<Warning> warningList = [
      Warning(
        title: "MDU error",
        message: 'faulty gearbox',
      ),
      Warning(
        title: "Battery error",
        message: 'overheated',
      )
      // Add more Warning objects as needed.
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WarningsBottomSheet(warnings: warningList);
      },
    );
  }

  Future<void> showRideDetailsDialog(String destination, String bikename,
      String date, String startlocation, double distance, int time) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BikeDetailsBox(
          Destination: destination,
          bikeName: bikename,
          date: date,
          distance: distance,
          startLocation: startlocation,
          time: time,
        );
      },
    );
  }

  Future<void> showBikeDetailsDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BikeDetails(
          selectedBike:
              Bike(name: 'LOKKA', image: 'assets/images/LOKKA_BIKE.png'),
        );
      },
    );
  }
}
