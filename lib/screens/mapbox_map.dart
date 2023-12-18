import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart' as location_lb;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_search/mapbox_search.dart' as mapbox_search;
import '../utils/constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final String mapboxAccessToken =
      'sk.eyJ1IjoicmF5ZW4xMiIsImEiOiJjbGxjYjVqN3IwajR1M2VtZzZ5ODJmbnFmIn0.tKgrKQdYP8EDwEg_QEcnzA';
  final TextEditingController _searchController = TextEditingController();
  List<mapbox_search.MapBoxPlace> _searchResults = [];
  bool _isSearching = false;
  List<LatLng> routeCoordinates = [];
  location_lb.Location location = location_lb.Location();
  StreamSubscription<location_lb.LocationData>? _locationSubscription;
  LatLng? destinationPoint;
  SymbolOptions? _userLocationOptions;
  Timer? _cameraUpdateTimer;

  @override
  void initState() {
    super.initState();
    _userLocationOptions = const SymbolOptions(
        iconImage: 'user', iconSize: 0.8 // Replace with your icon image asset
        );
    _startUpdatingLocation();
    _startCameraUpdateTimer(); // Start the camera update timer

    //  _getLocation();
  }

  final SymbolOptions defaultUserLocationOptions = const SymbolOptions(
    geometry: LatLng(0, 0), // Default coordinates (e.g., origin)
    iconImage: 'user', // Use your desired default icon
    iconSize: 0.8,
// Text anchor position
  );

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _cameraUpdateTimer?.cancel(); // Cancel the camera update timer
    super.dispose();
  }

  void _startCameraUpdateTimer() {
    _cameraUpdateTimer = Timer.periodic(const Duration(seconds: 7), (timer) {
      _updateCameraToUserLocation();
    });
  }

// ... Inside _updateCameraToUserLocation function ...

  void _updateCameraToUserLocation() async {
    location_lb.LocationData? locationData = await location.getLocation();
    if (locationData != null && controller != null) {
      double offsetLatitude =
          locationData.latitude! - 0.0015; // Adjust this offset as needed
      controller!.animateCamera(
        CameraUpdate.newLatLng(LatLng(offsetLatitude, locationData.longitude!)),
      );
    }
  }

  void _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;

    var markerImage = await loadMarkerImage("assets/images/pin.png");
    var userImage = await loadMarkerImage("assets/images/user_pin.png");

    // Add marker and user images
    this.controller!.addImage('marker', markerImage);
    this.controller!.addImage('user', userImage);

    // Add the destination symbol

    // Add the user location symbol with a unique ID
    this.controller!.symbolManager!.add(Symbol(
          'user_location', // Unique ID for user location symbol
          const SymbolOptions(
            geometry: LatLng(0, 0), // Default coordinates
            iconImage: 'user', // Use your desired user icon
            iconSize: 0.8,
          ),
        ));
  }

  void _startUpdatingLocation() {
    _locationSubscription = location.onLocationChanged.listen((locationData) {
      setState(() {
        _userLocationOptions = SymbolOptions(
          geometry: LatLng(locationData.latitude!, locationData.longitude!),
          iconImage: 'user', // Use your desired user icon
          iconSize: 0.8,
        );
      });

      // Update user location symbol on the map

      if (controller != null) {
        final existingSymbol = controller!.symbols.firstWhere(
          (symbol) => symbol.id == 'user_location', // Use the unique ID
          orElse: () =>
              Symbol('default_user_location', defaultUserLocationOptions),
        );

        if (existingSymbol != null) {
          // Update the existing user location symbol
          controller!.updateSymbol(
            existingSymbol,
            SymbolOptions(
              geometry: _userLocationOptions!.geometry,
              iconImage: 'user', // Use your desired user icon
              iconSize: 0.8,
            ),
          );
        } else {
          // Handle the case where the symbol is not found
          print("User symbol not found in the symbols list.");
        }
      }
      if (destinationPoint != null) {
        LatLng userLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
        fetchRouteCoordinates(userLocation, destinationPoint!);
      }

      // ... Rest of your code ...
    });
  }

  MapboxMapController? controller;
  Future<Uint8List> loadMarkerImage(String asset) async {
    var byteData = await rootBundle.load(asset);
    print(byteData);
    return byteData.buffer.asUint8List();
  }

  void _performSearch(String query) async {
    if (query.isEmpty || query == "") {
      setState(() {
        _isSearching = false;
        _searchResults.clear();
      });
      return;
    }

    final places = await mapbox_search.PlacesSearch(
      apiKey:
          'sk.eyJ1IjoicmF5ZW4xMiIsImEiOiJjbGxjYjVqN3IwajR1M2VtZzZ5ODJmbnFmIn0.tKgrKQdYP8EDwEg_QEcnzA',
      limit: 5,
    ).getPlaces(query);

    setState(() {
      print("printed places $places");
      _searchResults = places!;
      _isSearching = true;
    });
  }

  Future<void> fetchRouteCoordinates(
      LatLng userlocation, LatLng endPoint) async {
    final url =
        'https://api.mapbox.com/directions/v5/mapbox/driving/${userlocation.longitude},${userlocation.latitude};${endPoint.longitude},${endPoint.latitude}?access_token=$mapboxAccessToken&overview=full';

    final response = await http.get(Uri.parse(url));
    final responseBody = utf8.decode(response.bodyBytes);
    final data = json.decode(responseBody);
    debugPrint(data.toString());

    final routes = data['routes'] as List<dynamic>;
    if (routes.isNotEmpty) {
      final route = routes[0];
      final encodedPolyline = route['geometry'] as String;

      routeCoordinates = decodeEncodedPolyline(encodedPolyline);
    }

    await controller!.lineManager!.clear();

    await controller!.addLine(LineOptions(
        geometry: routeCoordinates, lineColor: "#0082FC", lineWidth: 4));
    setState(() {});
  }

  List<LatLng> decodeEncodedPolyline(String encoded) {
    List<LatLng> decoded = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      decoded.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return decoded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        MapboxMap(
          tiltGesturesEnabled: true,
          accessToken: mapboxAccessToken,
          onMapCreated: _onMapCreated,
          onMapLongClick: (a, b) async {
            controller!.symbolManager!.add(Symbol(
                "destination",
                SymbolOptions(
                  geometry: b,
                  iconImage: 'marker',
                  iconSize: 0.7,
                )));
            //  fetchRouteCoordinates(,b);
            debugPrint(
                "destination ::::::::::::" + controller!.symbols.first.id);
            setState(() {
              destinationPoint = b;
            });
          },
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0), // Example starting center
            zoom: 16.0,
            tilt: 45,
            // Example initial zoom level
          ),
          styleString: 'mapbox://styles/rayen12/cll6qijp600m301p822pf491n',
          // Your style URL
        ),
        Positioned(
          top: 40,
          child: SizedBox(
            width: 250,
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                setState(() {
                  _performSearch(query); // Trigger search on text change
                  _isSearching = query.isNotEmpty || query != "";
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodySmall,
                filled: true,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.77),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(60),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 2,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.map_pin_ellipse,
                    size: 25.0,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    CupertinoIcons.clear,
                    size: 20,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _isSearching = false;
                    });
                  },
                ),
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        Positioned(
          top: 90,
          child: AnimatedContainer(
            width: 350,
            duration: Duration(milliseconds: 500),
            height: _isSearching ? MediaQuery.of(context).size.height / 3 : 0,
            curve: Curves.easeInOutCirc,
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return _buildSearchResult(_searchResults[index]);
              },
            ),
          ),
        )
      ]),
    );
  }

  Widget _buildSearchResult(mapbox_search.MapBoxPlace place) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).primaryColor.withOpacity(0.6)),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: kAccentRed),
          const SizedBox(width: 10.0),
          Expanded(
              child: Text(
            place.placeName ?? 'null',
            style: Theme.of(context).textTheme.bodySmall,
          )),
          const SizedBox(width: 10.0),
          ElevatedButton(
            onPressed: () async {
              LatLng b = LatLng(place.geometry!.coordinates!.first,
                  place.geometry!.coordinates!.last);
              controller!.symbolManager!.add(Symbol(
                  "destination",
                  SymbolOptions(
                    geometry: b,
                    iconImage: 'marker',
                    iconSize: 0.7,
                  )));
              debugPrint(
                  "destination ::::::::::::" + controller!.symbols.first.id);
              setState(() {
                destinationPoint = b;
              });
              print(b);
            },
            style: ElevatedButton.styleFrom(
              primary: kAccentGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Go Now',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
