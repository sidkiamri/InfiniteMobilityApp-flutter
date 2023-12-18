import 'package:ebike/utils/constants.dart';
import 'package:ebike/widgets/widget.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Service',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 70,
          elevation: 0,
        ),
        body: SafeArea(
          child: CustomScrollView(
            reverse: false,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BikeImageStatus(
                        state: ImageState.batteryError,
                      ),
                      ServiceScreenState(state: CustomState.batteryError),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Solar and Charger's Battery Charging Contribution",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Center(
                        child: SizedBox(
                            height: 200,
                            width: 250,
                            child: MyDoughnutChart(
                              chargerContribution: 43.5,
                              pvContribution: 56.5,
                            )),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.solar_power,
                            color: kAccentBlue,
                          ),
                          Text("Solar Panel"),
                          SizedBox(
                            width: 40,
                          ),
                          Icon(
                            Icons.power,
                            color: kAccentRed,
                          ),
                          Text("Charger")
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Number of KW produced by Solar PhotoVlotaic",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      buildBarChart(),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
