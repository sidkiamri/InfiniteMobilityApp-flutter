import 'package:flutter/material.dart';

class Bike {
  final String name;
  final String image;

  Bike({required this.name, required this.image});
}

class ScooterBottomSheet extends StatefulWidget {
  final List<Bike> bikes;

  ScooterBottomSheet({required this.bikes});

  @override
  _ScooterBottomSheetState createState() => _ScooterBottomSheetState();
}

class _ScooterBottomSheetState extends State<ScooterBottomSheet> {
  int _selectedIndex = -1; // -1 means no selection

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select your bike',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            for (int index = 0; index < widget.bikes.length; index++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _selectedIndex == index
                        ? const Color.fromARGB(45, 30, 75, 138)
                        : Colors.transparent,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: _selectedIndex == index
                            ? const Icon(Icons.check,
                                size: 20, color: Colors.black)
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.bikes[index].name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              widget.bikes[index].image,
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
